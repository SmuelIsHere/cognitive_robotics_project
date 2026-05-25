;; Auto-generated. Do not edit!


(when (boundp 'progetto::Rest)
  (if (not (find-package "PROGETTO"))
    (make-package "PROGETTO"))
  (shadow 'Rest (find-package "PROGETTO")))
(unless (find-package "PROGETTO::REST")
  (make-package "PROGETTO::REST"))
(unless (find-package "PROGETTO::RESTREQUEST")
  (make-package "PROGETTO::RESTREQUEST"))
(unless (find-package "PROGETTO::RESTRESPONSE")
  (make-package "PROGETTO::RESTRESPONSE"))

(in-package "ROS")





(defclass progetto::RestRequest
  :super ros::object
  :slots ())

(defmethod progetto::RestRequest
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

(defclass progetto::RestResponse
  :super ros::object
  :slots (_ack ))

(defmethod progetto::RestResponse
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

(defclass progetto::Rest
  :super ros::object
  :slots ())

(setf (get progetto::Rest :md5sum-) "b6a73f722475d64a28238118997ef482")
(setf (get progetto::Rest :datatype-) "progetto/Rest")
(setf (get progetto::Rest :request) progetto::RestRequest)
(setf (get progetto::Rest :response) progetto::RestResponse)

(defmethod progetto::RestRequest
  (:response () (instance progetto::RestResponse :init)))

(setf (get progetto::RestRequest :md5sum-) "b6a73f722475d64a28238118997ef482")
(setf (get progetto::RestRequest :datatype-) "progetto/RestRequest")
(setf (get progetto::RestRequest :definition-)
      "---
string ack
")

(setf (get progetto::RestResponse :md5sum-) "b6a73f722475d64a28238118997ef482")
(setf (get progetto::RestResponse :datatype-) "progetto/RestResponse")
(setf (get progetto::RestResponse :definition-)
      "---
string ack
")



(provide :progetto/Rest "b6a73f722475d64a28238118997ef482")


