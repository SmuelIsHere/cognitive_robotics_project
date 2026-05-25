; Auto-generated. Do not edit!


(cl:in-package progetto-srv)


;//! \htmlinclude StartAwareness-request.msg.html

(cl:defclass <StartAwareness-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass StartAwareness-request (<StartAwareness-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartAwareness-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartAwareness-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name progetto-srv:<StartAwareness-request> is deprecated: use progetto-srv:StartAwareness-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartAwareness-request>) ostream)
  "Serializes a message object of type '<StartAwareness-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartAwareness-request>) istream)
  "Deserializes a message object of type '<StartAwareness-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartAwareness-request>)))
  "Returns string type for a service object of type '<StartAwareness-request>"
  "progetto/StartAwarenessRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartAwareness-request)))
  "Returns string type for a service object of type 'StartAwareness-request"
  "progetto/StartAwarenessRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartAwareness-request>)))
  "Returns md5sum for a message object of type '<StartAwareness-request>"
  "6de314e2dc76fbff2b6244a6ad70b68d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartAwareness-request)))
  "Returns md5sum for a message object of type 'StartAwareness-request"
  "6de314e2dc76fbff2b6244a6ad70b68d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartAwareness-request>)))
  "Returns full string definition for message of type '<StartAwareness-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartAwareness-request)))
  "Returns full string definition for message of type 'StartAwareness-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartAwareness-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartAwareness-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StartAwareness-request
))
;//! \htmlinclude StartAwareness-response.msg.html

(cl:defclass <StartAwareness-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform ""))
)

(cl:defclass StartAwareness-response (<StartAwareness-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartAwareness-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartAwareness-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name progetto-srv:<StartAwareness-response> is deprecated: use progetto-srv:StartAwareness-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <StartAwareness-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader progetto-srv:response-val is deprecated.  Use progetto-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartAwareness-response>) ostream)
  "Serializes a message object of type '<StartAwareness-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartAwareness-response>) istream)
  "Deserializes a message object of type '<StartAwareness-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'response) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartAwareness-response>)))
  "Returns string type for a service object of type '<StartAwareness-response>"
  "progetto/StartAwarenessResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartAwareness-response)))
  "Returns string type for a service object of type 'StartAwareness-response"
  "progetto/StartAwarenessResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartAwareness-response>)))
  "Returns md5sum for a message object of type '<StartAwareness-response>"
  "6de314e2dc76fbff2b6244a6ad70b68d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartAwareness-response)))
  "Returns md5sum for a message object of type 'StartAwareness-response"
  "6de314e2dc76fbff2b6244a6ad70b68d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartAwareness-response>)))
  "Returns full string definition for message of type '<StartAwareness-response>"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartAwareness-response)))
  "Returns full string definition for message of type 'StartAwareness-response"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartAwareness-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartAwareness-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StartAwareness-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StartAwareness)))
  'StartAwareness-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StartAwareness)))
  'StartAwareness-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartAwareness)))
  "Returns string type for a service object of type '<StartAwareness>"
  "progetto/StartAwareness")