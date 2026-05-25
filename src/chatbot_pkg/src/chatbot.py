#!/usr/bin/env python3
import os
import rospkg
import rospy
import requests
import json
from collections import deque
from std_msgs.msg import String
from chatbot_utils import load_json, generate_context  


NODE_NAME = "chatbot_node"
# topic per quello che dice l'utente
SUBSCRIBER_TOPIC_MESSAGE = "/voice_txt"
# topic per le emozioni rilevate dall'utente
SUBSCRIBER_TOPIC_EMOTION = "/faces_emotions"

PUBLISHER_TOPIC = "/chatbot_response"        
MEMORY_SIZE = 15  

current_emotion = "neutral"

# memoria della conversazione
memory = deque(maxlen=MEMORY_SIZE)

class ChatbotNode:
    def __init__(self):
        rospy.init_node(NODE_NAME)
        rospack = rospkg.RosPack()
        pkg_path = rospack.get_path("chatbot_pkg") 

        config = os.path.join(pkg_path, "src/chatbot_data/config.json")
        results = os.path.join(pkg_path, "src/chatbot_data/results.json")
        ranking = os.path.join(pkg_path, "src/chatbot_data/ranking.json")

        # Load configuration and data files
        self.config = load_json(config)
        self.results = load_json(results)
        self.ranking = load_json(ranking)

        # Generate chatbot context
        self.base_context = generate_context(self.results, self.ranking)

        # ROS publishers and subscribers
        self.publisher = rospy.Publisher(PUBLISHER_TOPIC, String, queue_size=100)
        rospy.Subscriber(SUBSCRIBER_TOPIC_MESSAGE, String, self.handle_message)
        rospy.Subscriber(SUBSCRIBER_TOPIC_EMOTION, String, self.handle_emotion)
        rospy.Subscriber('mic_state', String, self.handle_micState)
        rospy.Subscriber('activate_chatbot', String, self.handle_activate)
        self.activate = 'off'
        self.mic_state = 'off'
        rospy.loginfo("Chatbot node avviato. In attesa di messaggi ed emozioni...")

    def handle_micState(self, msg):
        self.mic_state = msg.data

    def handle_activate(self, msg):
        self.activate = msg.data

    def handle_message(self, msg):
        """Handles incoming messages from ROS and generates a response."""
        response = self.get_chatbot_response(msg.data)
        if msg is not None and self.activate == 'on' and self.mic_state == 'on':
            self.publisher.publish(response)

    def handle_emotion(self, msg):
        """Receives JSON input and extracts the emotion key."""
        global current_emotion
        try:
            data = json.loads(msg.data)
            if "emotion" in data:
                current_emotion = data["emotion"]
                rospy.loginfo(f"Rilevata emozione: {current_emotion}")
        except json.JSONDecodeError:
            rospy.logerr("Errore nel parsing del JSON delle emozioni.")

    def get_chatbot_response(self, message):
        """Sends a message to the Gemini API and retrieves a response, 
            adapting to the detected emotion."""
        
        api_key = self.config.get("api_key", "")
        url = self.config.get("url", "") + api_key

        if not api_key or not url:
            return "Errore: Configurazione API mancante."

        memory.append(f"Utente ({current_emotion}): {message}")
        current_context = self.base_context + "\n\nConversazione recente:\n" + "\n".join(memory)

        # Adjust chatbot response based on detected emotion
        emotion_modifier = self.get_emotion_modifier()

        headers = {"Content-Type": "application/json"}
        data = {
            "contents": [
                {
                    "role": "user",
                    "parts": [
                        {"text": f"{current_context}\n\n{emotion_modifier} Chatbot:"}
                    ]
                }
            ]
        }

        response = requests.post(url, json=data, headers=headers)

        if response.status_code == 200:
            result = response.json()
            try:
                reply = result["candidates"][0]["content"]["parts"][0]["text"].strip()
                memory.append(f"Chatbot: {reply}")
                return reply
            except KeyError:
                return "Errore: Risposta API non strutturata correttamente."
        else:
            return f"Errore API: {response.status_code}, {response.text}"

    def get_emotion_modifier(self):
        """Modifies chatbot responses based on detected emotion."""
        if current_emotion == "happiness":
            return "Rispondi in modo entusiasta e positivo."
        elif current_emotion == "sadness":
            return "Rispondi con gentilezza e supporto emotivo."
        elif current_emotion == "anger":
            return "Rispondi con calma e rassicurazione."
        elif current_emotion == "neutral":
            return "Rispondi normalmente senza emozioni aggiuntive."
        elif current_emotion == "surprise":
            return "Rispondi in modo sorpreso e scherzoso."
        elif current_emotion == "disgust":
            return "Rispondi con calma e rassicurazione."
        else:
            return "Rispondi normalmente."


if __name__ == "__main__":
    try:
        ChatbotNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        rospy.loginfo("Chatbot node terminato.")
