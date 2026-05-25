#!/usr/bin/python3
import rospy
from std_msgs.msg import String
from progetto.srv import Text2Speech

mic_state = None

def callback_mic_on(flag):
    mic_state = flag

def callback_tts_service(text):
    pub_state = rospy.Publisher('mic_state', String, queue_size=100)
    # Attendi che il servizio di tts sia disponibile
    rospy.wait_for_service('tts')
    pub_state.publish('off')  
    try:
        tts_service = rospy.ServiceProxy('tts', Text2Speech)  
        
        response = tts_service(str(text.data))
            
    except rospy.ServiceException as e:
        print("Errore nel chiamare il servizio:", e)

if __name__ == "__main__":
    rospy.init_node('tts_client')
    rospy.Subscriber('chatbot_response', String, callback_tts_service)
    end_service_confirm_pub = rospy.Publisher('end_service_confirm', String, queue_size=1)
    rospy.Subscriber('mic_state', String, callback_mic_on)
    rospy.spin()