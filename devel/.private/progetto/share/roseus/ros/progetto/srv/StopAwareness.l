;; Auto-generated. Do not edit!


(when (boundp 'progetto::StopAwareness)
  (if (not (find-package "PROGETTO"))
    (make-package "PROGETTO"))
  (shadow 'StopAwareness (find-package "PROGETTO")))
(unless (find-package "PROGETTO::STOPAWARENESS")
  (make-package "PROGETTO::STOPAWARENESS"))
(unless (find-package "PROGETTO::STOPAWARENESSREQUEST")
  (make-package "PROGETTO::STOPAWARENESSREQUEST"))
(unless (find-package "PROGETTO::STOPAWARENESSRESPONSE")
  (make-package "PROGETTO::STOPAWARENESSRESPONSE"))

(in-package "ROS")





(defclass progetto::StopAwarenessRequest
  :super ros::object
  :slots ())

(defmethod progetto::StopAwarenessRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass progetto::StopAwarenessResponse
  :super ros::object
  :slots (_response ))

(defmethod progetto::StopAwarenessResponse
  (:init
   (&key
    ((:response __response) "")
    )
   (send-super :init)
   (setq _response (string __response))
   self)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; string _response
    4 (length _response)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _response
       (write-long (length _response) s) (princ _response s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _response
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _response (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass progetto::StopAwareness
  :super ros::object
  :slots ())

(setf (get progetto::StopAwareness :md5sum-) "6de314e2dc76fbff2b6244a6ad70b68d")
(setf (get progetto::StopAwareness :datatype-) "progetto/StopAwareness")
(setf (get progetto::StopAwareness :request) progetto::StopAwarenessRequest)
(setf (get progetto::StopAwareness :response) progetto::StopAwarenessResponse)

(defmethod progetto::StopAwarenessRequest
  (:response () (instance progetto::StopAwarenessResponse :init)))

(setf (get progetto::StopAwarenessRequest :md5sum-) "6de314e2dc76fbff2b6244a6ad70b68d")
(setf (get progetto::StopAwarenessRequest :datatype-) "progetto/StopAwarenessRequest")
(setf (get progetto::StopAwarenessRequest :definition-)
      "---
string response
")

(setf (get progetto::StopAwarenessResponse :md5sum-) "6de314e2dc76fbff2b6244a6ad70b68d")
(setf (get progetto::StopAwarenessResponse :datatype-) "progetto/StopAwarenessResponse")
(setf (get progetto::StopAwarenessResponse :definition-)
      "---
string response
")



(provide :progetto/StopAwareness "6de314e2dc76fbff2b6244a6ad70b68d")


