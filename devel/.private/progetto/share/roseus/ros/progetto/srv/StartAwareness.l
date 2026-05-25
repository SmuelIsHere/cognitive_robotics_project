;; Auto-generated. Do not edit!


(when (boundp 'progetto::StartAwareness)
  (if (not (find-package "PROGETTO"))
    (make-package "PROGETTO"))
  (shadow 'StartAwareness (find-package "PROGETTO")))
(unless (find-package "PROGETTO::STARTAWARENESS")
  (make-package "PROGETTO::STARTAWARENESS"))
(unless (find-package "PROGETTO::STARTAWARENESSREQUEST")
  (make-package "PROGETTO::STARTAWARENESSREQUEST"))
(unless (find-package "PROGETTO::STARTAWARENESSRESPONSE")
  (make-package "PROGETTO::STARTAWARENESSRESPONSE"))

(in-package "ROS")





(defclass progetto::StartAwarenessRequest
  :super ros::object
  :slots ())

(defmethod progetto::StartAwarenessRequest
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

(defclass progetto::StartAwarenessResponse
  :super ros::object
  :slots (_response ))

(defmethod progetto::StartAwarenessResponse
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

(defclass progetto::StartAwareness
  :super ros::object
  :slots ())

(setf (get progetto::StartAwareness :md5sum-) "6de314e2dc76fbff2b6244a6ad70b68d")
(setf (get progetto::StartAwareness :datatype-) "progetto/StartAwareness")
(setf (get progetto::StartAwareness :request) progetto::StartAwarenessRequest)
(setf (get progetto::StartAwareness :response) progetto::StartAwarenessResponse)

(defmethod progetto::StartAwarenessRequest
  (:response () (instance progetto::StartAwarenessResponse :init)))

(setf (get progetto::StartAwarenessRequest :md5sum-) "6de314e2dc76fbff2b6244a6ad70b68d")
(setf (get progetto::StartAwarenessRequest :datatype-) "progetto/StartAwarenessRequest")
(setf (get progetto::StartAwarenessRequest :definition-)
      "---
string response
")

(setf (get progetto::StartAwarenessResponse :md5sum-) "6de314e2dc76fbff2b6244a6ad70b68d")
(setf (get progetto::StartAwarenessResponse :datatype-) "progetto/StartAwarenessResponse")
(setf (get progetto::StartAwarenessResponse :definition-)
      "---
string response
")



(provide :progetto/StartAwareness "6de314e2dc76fbff2b6244a6ad70b68d")


