#!/usr/bin/python3
import rospy
from std_msgs.msg import Int16MultiArray, String
import numpy as np

import time
import speech_recognition as sr

pub = rospy.Publisher('mic_data', Int16MultiArray, queue_size=100)
pub_state = rospy.Publisher('mic_state', String, queue_size=100)
rospy.init_node('voice_detection_node', anonymous=False)

# questa callback è relativa al recognizer, viene chiamata
# quando viene rilevato dell'audio dal microfono
def callback(recognizer, audio):
    pub_state.publish('on')
    data = np.frombuffer(audio.get_raw_data(), dtype=np.int16)
    data_to_send = Int16MultiArray()
    data_to_send.data = data
    pub.publish(data_to_send)
    

# Initialize a Recognizer
r = sr.Recognizer()
r.dynamic_energy_threshold = True 
r.energy_threshold = 150 #Modify here to set threshold. Reference: https://github.com/Uberi/speech_recognition/blob/1b737c5ceb3da6ad59ac573c1c3afe9da45c23bc/speech_recognition/__init__.py#L332
m = sr.Microphone(device_index=None,
                    sample_rate=16000,
                    chunk_size=1024)

# calibrazione che considera il noise ambientale
# per le future rilevazioni dell'audio
print("Calibrating...")
with m as source:
    r.adjust_for_ambient_noise(source,duration=3)  
print("Calibration finished")

# start listening in the background
print("Recording...")
stop_listening = r.listen_in_background(m, callback)
rospy.spin()
