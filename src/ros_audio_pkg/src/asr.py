#!/usr/bin/python3
import rospy
from std_msgs.msg import Int16MultiArray, String
import numpy as np
import speech_recognition as sr
from speech_recognition import AudioData

r = sr.Recognizer()
mic_state = None

# quando viene inviata l'informazione sullo stato del
# microfono , viene aggiornato il flag interno allo script
def mic_callback(flag):
    mic_state = flag

# Init node
rospy.init_node('speech_recognition', anonymous=True)
pub1 = rospy.Publisher('voice_data', Int16MultiArray, queue_size=10)
pub2 = rospy.Publisher('voice_txt', String, queue_size=1)
rospy.Subscriber('mic_state', String, mic_callback)


# this is called from the background thread
def callback(audio):
    if mic_state != 'on':
        data = np.array(audio.data,dtype=np.int16)
        audio_data = AudioData(data.tobytes(), 16000, 2)

        try:
            spoken_text= r.recognize_google(audio_data, language='it-IT')
            print("Google Speech Recognition pensa tu abbia detto: " + spoken_text)

            pub1.publish(audio)
            pub2.publish(spoken_text)
        except sr.UnknownValueError:
            print("Google Speech Recognition non riesce a capire da questo file audio")
        except sr.RequestError as e:
            print("Could not request results from Google Speech Recognition service; {0}".format(e))

def listener():
    rospy.Subscriber("mic_data", Int16MultiArray, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()