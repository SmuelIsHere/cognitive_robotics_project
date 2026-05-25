#!/usr/bin/python3
from utils import Session
from optparse import OptionParser
import rospy
from std_msgs.msg import String
from progetto.srv import StartAwareness, StopAwareness

class AwarenessNode:
    '''
    This class implements a ROS node to control Pepper's awareness features.
    '''
    def __init__(self, ip, port):
        '''
        Constructor initializes the connection with Pepper and sets up services.
        '''
        self.ip = ip
        self.port = port
        self.session = Session(ip, port)
        self.awareness_proxy = self.session.get_service("ALBasicAwareness")
        rospy.Subscriber('voice_txt', String, self.handle_voice_command)
        self.pub = rospy.Publisher('activate_chatbot', String, queue_size=100)

    def handle_voice_command(self, msg):
        if msg is not None:    
            if 'arrivederci' in msg.data or 'Arrivederci' in msg.data:
                self.pub.publish('off')
                self.stop_awareness()
            if 'pepper' in msg.data or 'Pepper' in msg.data:
                self.pub.publish('on')
                self.start_awareness()
        

    def start_awareness(self, *args):
        '''
        Starts the robot's awareness module.
        '''
        try:
            rospy.loginfo("Starting awareness.")
            self.awareness_proxy.setEnabled(True)
            self.awareness_proxy.setTrackingMode("Head")
            self.awareness_proxy.setEngagementMode("SemiEngaged")
            self.awareness_proxy.setStimulusDetectionEnabled("People", True)
        except Exception as e:
            rospy.logerr(f"Failed to start awareness: {e}")
            self.awareness_proxy = self.session.get_service("ALBasicAwareness")
            self.awareness_proxy.setEnabled(True)

        return "ACK"

    def stop_awareness(self, *args):
        '''
        Stops the robot's awareness module and sets it to rest.
        '''
        try:
            rospy.loginfo("Stopping awareness and putting the robot to rest.")
            self.awareness_proxy.setEnabled(False)
        except Exception as e:
            rospy.logerr(f"Failed to stop awareness: {e}")
            self.awareness_proxy = self.session.get_service("ALBasicAwareness")
            self.awareness_proxy.setEnabled(False)

        return "ACK"
    
    def handle_shutdown(self):
        '''def mic_callback(flag):
        Stops awareness and sets the robot to rest during node shutdown.
        '''
        rospy.loginfo("Node is shutting down. Stopping awareness.")
        self.stop_awareness()

    def start(self):
        '''
        Starts the ROS node and initializes services.
        '''
        rospy.init_node("awareness_node")

        # Register a shutdown callback to stop awareness when the node is closed
        
        # Initialize services
        rospy.Service("start_awareness", StartAwareness, self.start_awareness)
        rospy.Service("stop_awareness", StopAwareness, self.stop_awareness)

        rospy.loginfo("Awareness node is ready.")

if __name__ == "__main__":
    parser = OptionParser()
    parser.add_option("--ip", dest="ip", default="10.0.1.207", help="IP address of the robot")
    parser.add_option("--port", dest="port", default=9559, help="Port number of the robot")
    (options, args) = parser.parse_args()

    try:
        node = AwarenessNode(options.ip, int(options.port))
        node.start()
        rospy.spin()
        node.handle_shutdown()
    except rospy.ROSInterruptException:
        rospy.on_shutdown(node.handle_shutdown)
        pass