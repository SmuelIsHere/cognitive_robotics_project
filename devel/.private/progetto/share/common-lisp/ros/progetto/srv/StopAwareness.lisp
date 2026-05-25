; Auto-generated. Do not edit!


(cl:in-package progetto-srv)


;//! \htmlinclude StopAwareness-request.msg.html

(cl:defclass <StopAwareness-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass StopAwareness-request (<StopAwareness-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopAwareness-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopAwareness-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name progetto-srv:<StopAwareness-request> is deprecated: use progetto-srv:StopAwareness-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopAwareness-request>) ostream)
  "Serializes a message object of type '<StopAwareness-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopAwareness-request>) istream)
  "Deserializes a message object of type '<StopAwareness-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopAwareness-request>)))
  "Returns string type for a service object of type '<StopAwareness-request>"
  "progetto/StopAwarenessRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAwareness-request)))
  "Returns string type for a service object of type 'StopAwareness-request"
  "progetto/StopAwarenessRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopAwareness-request>)))
  "Returns md5sum for a message object of type '<StopAwareness-request>"
  "6de314e2dc76fbff2b6244a6ad70b68d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopAwareness-request)))
  "Returns md5sum for a message object of type 'StopAwareness-request"
  "6de314e2dc76fbff2b6244a6ad70b68d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopAwareness-request>)))
  "Returns full string definition for message of type '<StopAwareness-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopAwareness-request)))
  "Returns full string definition for message of type 'StopAwareness-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopAwareness-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopAwareness-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StopAwareness-request
))
;//! \htmlinclude StopAwareness-response.msg.html

(cl:defclass <StopAwareness-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform ""))
)

(cl:defclass StopAwareness-response (<StopAwareness-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopAwareness-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopAwareness-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name progetto-srv:<StopAwareness-response> is deprecated: use progetto-srv:StopAwareness-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <StopAwareness-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader progetto-srv:response-val is deprecated.  Use progetto-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopAwareness-response>) ostream)
  "Serializes a message object of type '<StopAwareness-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopAwareness-response>) istream)
  "Deserializes a message object of type '<StopAwareness-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopAwareness-response>)))
  "Returns string type for a service object of type '<StopAwareness-response>"
  "progetto/StopAwarenessResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAwareness-response)))
  "Returns string type for a service object of type 'StopAwareness-response"
  "progetto/StopAwarenessResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopAwareness-response>)))
  "Returns md5sum for a message object of type '<StopAwareness-response>"
  "6de314e2dc76fbff2b6244a6ad70b68d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopAwareness-response)))
  "Returns md5sum for a message object of type 'StopAwareness-response"
  "6de314e2dc76fbff2b6244a6ad70b68d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopAwareness-response>)))
  "Returns full string definition for message of type '<StopAwareness-response>"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopAwareness-response)))
  "Returns full string definition for message of type 'StopAwareness-response"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopAwareness-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopAwareness-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StopAwareness-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StopAwareness)))
  'StopAwareness-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StopAwareness)))
  'StopAwareness-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAwareness)))
  "Returns string type for a service object of type '<StopAwareness>"
  "progetto/StopAwareness")