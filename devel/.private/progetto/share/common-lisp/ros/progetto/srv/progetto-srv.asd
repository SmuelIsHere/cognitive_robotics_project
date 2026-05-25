
(cl:in-package :asdf)

(defsystem "progetto-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Rest" :depends-on ("_package_Rest"))
    (:file "_package_Rest" :depends-on ("_package"))
    (:file "StartAwareness" :depends-on ("_package_StartAwareness"))
    (:file "_package_StartAwareness" :depends-on ("_package"))
    (:file "StopAwareness" :depends-on ("_package_StopAwareness"))
    (:file "_package_StopAwareness" :depends-on ("_package"))
    (:file "Text2Speech" :depends-on ("_package_Text2Speech"))
    (:file "_package_Text2Speech" :depends-on ("_package"))
    (:file "VoiceDetectionService" :depends-on ("_package_VoiceDetectionService"))
    (:file "_package_VoiceDetectionService" :depends-on ("_package"))
    (:file "WakeUp" :depends-on ("_package_WakeUp"))
    (:file "_package_WakeUp" :depends-on ("_package"))
  ))