#!/usr/bin/python3
# -*- coding: utf-8 -*-
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2

class Nodo(object):

    def __init__(self):
        # Params
        self.br = CvBridge()
        self.image = None
        self.face_data = []
        self.window_name = "Pepper Camera"
        self.faces_sub = rospy.Subscriber("/img_with_draw", Image, self.image_callback)
        
    
    def image_callback(self, msg):
        """
        This method receives an Image message and converts it to a numpy array.
        """
        try:
            self.image = self.br.imgmsg_to_cv2(msg, desired_encoding='bgr8')

            if self.image is not None:
                cv2.imshow("Image", self.image)
                cv2.waitKey(1)
            
        except Exception as e:
            rospy.logerr(f"Error processing image: {e}")

    def start(self):
        """
        Starts the ROS node loop.
        """
        try:
            rospy.spin()
        except rospy.ROSInterruptException:
            pass
        finally:
            cv2.destroyAllWindows()

if __name__ == '__main__':
    rospy.init_node("camera_show_node", anonymous=True)
    my_node = Nodo()
    my_node.start()