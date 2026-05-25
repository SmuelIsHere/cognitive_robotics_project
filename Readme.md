# Cognitive Robotics: Pepper Robot Assistant

## Project Overview
This repository contains the implementation of a cognitive robotic system based on the **Pepper robot**, developed to interact with users in a shopping mall environment. The robot acts as an intelligent assistant capable of answering questions about visitors, providing information regarding an ongoing contest, and assisting in the search for lost individuals.

The entire software infrastructure is built on a **ROS (Robot Operating System)** architecture, enabling seamless communication between vision, audio, and dialogue management modules.

## Key Features
* **Emotion-Aware Dialogue System:** Powered by the **Google Gemini API**, the chatbot maintains conversational memory (up to 15 messages) and dynamically adapts its tone based on the user's facial emotions (e.g., enthusiastic if the user is happy, reassuring if sad).
* **Face & Emotion Recognition:** Utilizes OpenCV for face detection and a custom TensorFlow/Keras neural network to classify 7 different emotions in real-time.
* **Speech-to-Text (STT) & Text-to-Speech (TTS):** Integrates Google Speech Recognition to convert user audio into text, and SoftBank's NAOqi `ALTextToSpeech` service to give Pepper a natural voice.
* **Human-Awareness:** Implements NAOqi's `ALBasicAwareness` to make the robot physically track and follow the user's movements during a conversation.

## System Architecture (ROS Nodes)
The system is highly modularized into distinct ROS nodes:
1. **Core & Awareness:** `wake_up_node`, `basic_awareness_node` (activated by the hotword "Pepper").
2. **Video Analytics:** `image_input_node`, `face_detection` (draws bounding boxes and emotion labels), `camera_show_node`.
3. **Audio Processing:** `voice_detection` (captures mic data), `speech_recognition_node`.
4. **Dialogue Management:** `chatbot_node` (integrates Gemini and context from JSON files), `tts_client`, `text2speech_node`.

## Setup & Configuration
To run this project, you will need:
* A working ROS environment compatible with NAOqi OS.
* **API Keys:** A valid Google Gemini API key configured in the respective JSON file.
* `results.json` and `ranking.json` files placed in the correct directory to provide context to the dialogue manager.

## How to Run

Follow these steps to set up the ROS workspace and launch the system:

```bash
# 1. Install dependencies
bash install_reqs.bash

# 2. Build the workspace
catkin build

# 3. Source the workspace 
# (WARNING: You must run 'source devel/setup.bash' in EVERY new terminal you open)
source devel/setup.bash

# 4. Start the ROS core (Open a new terminal for this)
roscore

# 5. Run the Image Publisher (In a new terminal, remember to source first)
rosrun image_publisher image_publisher test.jpg __name:=testcam

# 6. Run the Detector Node (In a new terminal, remember to source first)
rosrun detector detector_node.py image:=/testcam/image_raw

# 7. Run the Visualization Node (In a new terminal, remember to source first)
rosrun detector visualization_node.py image:=/testcam/image_raw
