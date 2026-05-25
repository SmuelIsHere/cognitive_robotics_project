#!/usr/bin/python3
# -*- coding: utf-8 -*-
import rospy
import json
from sensor_msgs.msg import Image
from std_msgs.msg import String
import cv2
import numpy as np
from tensorflow.keras.models import load_model
import rospkg
import os
from cv_bridge import CvBridge

# per capire 
print("Current working directory:", os.getcwd())

# Initialize detector
rospack = rospkg.RosPack()
pkg_path = rospack.get_path("progetto")

faceProto = os.path.join(pkg_path, "src/models/opencv_face_detector.pbtxt")
faceModel = os.path.join(pkg_path, "src/models/opencv_face_detector_uint8.pb")

faceNet = cv2.dnn.readNet(faceModel, faceProto)

# Initialize emotion classifier
emotionModel = os.path.join(pkg_path, "src/models/emotion.hdf5")
emotionNet = load_model(emotionModel)

emotionList = ['surprise','fear','disgust','happiness','sadness','anger','neutral']
padding = 0.2
MEANS=np.array([131.0912, 103.8827, 91.4953])
INPUT_SIZE = (224,224)

# CvBridge for ROS <-> OpenCV image conversion
bridge = CvBridge()

def getFaceBox(net, frame, conf_threshold=0.8):
    frameOpencvDnn = frame.copy()
    frameHeight, frameWidth = frame.shape[:2]
    blob = cv2.dnn.blobFromImage(frameOpencvDnn, 1.0, (300, 300), [104, 117, 123], True, False)
    net.setInput(blob)
    detections = net.forward()
    bboxes = []
    for i in range(detections.shape[2]):
        confidence = detections[0, 0, i, 2]
        if confidence > conf_threshold:
            x1 = int(detections[0, 0, i, 3] * frameWidth)
            y1 = int(detections[0, 0, i, 4] * frameHeight)
            x2 = int(detections[0, 0, i, 5] * frameWidth)
            y2 = int(detections[0, 0, i, 6] * frameHeight)
            bboxes.append([x1, y1, x2, y2])
    return frameOpencvDnn, bboxes


def callback(data):
    
    """Callback to process frames received from ROS topic."""
    try:
        frame = bridge.imgmsg_to_cv2(data, desired_encoding="bgr8")
    except Exception as e:
        rospy.logerr("Error converting image: %s", str(e))
        return

    frameFace, bboxes = getFaceBox(faceNet, frame)
    faces_emotions = []

    for bbox in bboxes:
        x1, y1, x2, y2 = bbox
        w, h = x2 - x1, y2 - y1
        padding_px = int(padding * max(w, h))
        face = frame[max(0, y1 - padding_px):min(y2 + padding_px, frame.shape[0] - 1),
                     max(0, x1 - padding_px):min(x2 + padding_px, frame.shape[1] - 1)]
        
        if face.shape[0] > 0 and face.shape[1] > 0:
            face_resized = cv2.resize(face, INPUT_SIZE)
            blob = np.array([face_resized.astype(float) - MEANS])
            emotionPreds = emotionNet.predict(blob)
            emotion = emotionList[np.argmax(emotionPreds[0])]
            faces_emotions.append({"bbox": bbox, "emotion": emotion})

    
    """
    Sezione di scrittura sul topic delle emozioni
    """
    if faces_emotions:
        invio = json.dumps(faces_emotions)
        emotions_pub.publish(invio)

    """
    Sezione di scrittura sul topic delle immagini
    """
    if frame is not None:
        if faces_emotions:
            for face in faces_emotions:
                try:
                    x1, y1, x2, y2 = face['bbox']
                    emotion = face['emotion'] 
                    cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 2)
                    cv2.putText(frame, emotion, (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (255, 0, 0), 2)    
                except KeyError as e:
                    rospy.logerr(f"Missing key in face data: {e}")
                    
        msg = bridge.cv2_to_imgmsg(frame, encoding="bgr8") #encoding brg8
        msg.header.stamp = rospy.Time.now()
        images_pub.publish(msg)

def listener():
    global emotions_pub
    global images_pub
    rospy.init_node('face_emotion_detector', anonymous=True)
    rospy.Subscriber('/in_rgb', Image, callback)
    emotions_pub = rospy.Publisher('/faces_emotions', String, queue_size=1)
    images_pub = rospy.Publisher('/img_with_draw', Image, queue_size=1)
    rospy.spin()

if __name__ == '__main__':
    listener()
