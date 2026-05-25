;; Auto-generated. Do not edit!


(when (boundp 'progetto::WakeUp)
  (if (not (find-package "PROGETTO"))
    (make-package "PROGETTO"))
  (shadow 'WakeUp (find-package "PROGETTO")))
(unless (find-package "PROGETTO::WAKEUP")
  (make-package "PROGETTO::WAKEUP"))
(unless (find-package "PROGETTO::WAKEUPREQUEST")
  (make-package "PROGETTO::WAKEUPREQUEST"))
(unless (find-package "PROGETTO::WAKEUPRESPONSE")
  (make-package "PROGETTO::WAKEUPRESPONSE"))

(in-package "ROS")





(defclass progetto::WakeUpRequest
  :super ros::object
  :slots ())

(defmethod progetto::WakeUpRequest
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

(defclass progetto::WakeUpResponse
  :super ros::object
  :slots (_ack ))

(defmethod progetto::WakeUpResponse
  (:init
   (&key
    ((:ack __ack) "")
    )
   (send-super :init)
   (setq _ack (string __ack))
   self)
  (:ack
   (&optional __ack)
   (if __ack (setq _ack __ack)) _ack)
  (:serialization-length
   ()
   (+
    ;; string _ack
    4 (length _ack)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _ack
       (write-long (length _ack) s) (princ _ack s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _ack
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ack (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass progetto::WakeUp
  :super ros::object
  :slots ())

(setf (get progetto::WakeUp :md5sum-) "b6a73f722475d64a28238118997ef482")
(setf (get progetto::WakeUp :datatype-) "progetto/WakeUp")
(setf (get progetto::WakeUp :request) progetto::WakeUpRequest)
(setf (get progetto::WakeUp :response) progetto::WakeUpResponse)

(defmethod progetto::WakeUpRequest
  (:response () (instance progetto::WakeUpResponse :init)))

(setf (get progetto::WakeUpRequest :md5sum-) "b6a73f722475d64a28238118997ef482")
(setf (get progetto::WakeUpRequest :datatype-) "progetto/WakeUpRequest")
(setf (get progetto::WakeUpRequest :definition-)
      "---
string ack
")

(setf (get progetto::WakeUpResponse :md5sum-) "b6a73f722475d64a28238118997ef482")
(setf (get progetto::WakeUpResponse :datatype-) "progetto/WakeUpResponse")
(setf (get progetto::WakeUpResponse :definition-)
      "---
string ack
")



(provide :progetto/WakeUp "b6a73f722475d64a28238118997ef482")


