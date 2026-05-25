# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "progetto: 0 messages, 6 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(progetto_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv" NAME_WE)
add_custom_target(_progetto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "progetto" "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv" "std_msgs/MultiArrayLayout:std_msgs/MultiArrayDimension:std_msgs/Int16MultiArray"
)

get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv" NAME_WE)
add_custom_target(_progetto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "progetto" "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv" ""
)

get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv" NAME_WE)
add_custom_target(_progetto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "progetto" "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv" ""
)

get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv" NAME_WE)
add_custom_target(_progetto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "progetto" "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv" ""
)

get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv" NAME_WE)
add_custom_target(_progetto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "progetto" "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv" ""
)

get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv" NAME_WE)
add_custom_target(_progetto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "progetto" "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto
)
_generate_srv_cpp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto
)
_generate_srv_cpp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto
)
_generate_srv_cpp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto
)
_generate_srv_cpp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto
)
_generate_srv_cpp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto
)

### Generating Module File
_generate_module_cpp(progetto
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(progetto_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(progetto_generate_messages progetto_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv" NAME_WE)
add_dependencies(progetto_generate_messages_cpp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv" NAME_WE)
add_dependencies(progetto_generate_messages_cpp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv" NAME_WE)
add_dependencies(progetto_generate_messages_cpp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv" NAME_WE)
add_dependencies(progetto_generate_messages_cpp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_cpp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_cpp _progetto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(progetto_gencpp)
add_dependencies(progetto_gencpp progetto_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS progetto_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto
)
_generate_srv_eus(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto
)
_generate_srv_eus(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto
)
_generate_srv_eus(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto
)
_generate_srv_eus(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto
)
_generate_srv_eus(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto
)

### Generating Module File
_generate_module_eus(progetto
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(progetto_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(progetto_generate_messages progetto_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv" NAME_WE)
add_dependencies(progetto_generate_messages_eus _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv" NAME_WE)
add_dependencies(progetto_generate_messages_eus _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv" NAME_WE)
add_dependencies(progetto_generate_messages_eus _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv" NAME_WE)
add_dependencies(progetto_generate_messages_eus _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_eus _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_eus _progetto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(progetto_geneus)
add_dependencies(progetto_geneus progetto_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS progetto_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto
)
_generate_srv_lisp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto
)
_generate_srv_lisp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto
)
_generate_srv_lisp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto
)
_generate_srv_lisp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto
)
_generate_srv_lisp(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto
)

### Generating Module File
_generate_module_lisp(progetto
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(progetto_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(progetto_generate_messages progetto_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv" NAME_WE)
add_dependencies(progetto_generate_messages_lisp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv" NAME_WE)
add_dependencies(progetto_generate_messages_lisp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv" NAME_WE)
add_dependencies(progetto_generate_messages_lisp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv" NAME_WE)
add_dependencies(progetto_generate_messages_lisp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_lisp _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_lisp _progetto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(progetto_genlisp)
add_dependencies(progetto_genlisp progetto_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS progetto_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto
)
_generate_srv_nodejs(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto
)
_generate_srv_nodejs(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto
)
_generate_srv_nodejs(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto
)
_generate_srv_nodejs(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto
)
_generate_srv_nodejs(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto
)

### Generating Module File
_generate_module_nodejs(progetto
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(progetto_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(progetto_generate_messages progetto_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv" NAME_WE)
add_dependencies(progetto_generate_messages_nodejs _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv" NAME_WE)
add_dependencies(progetto_generate_messages_nodejs _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv" NAME_WE)
add_dependencies(progetto_generate_messages_nodejs _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv" NAME_WE)
add_dependencies(progetto_generate_messages_nodejs _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_nodejs _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_nodejs _progetto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(progetto_gennodejs)
add_dependencies(progetto_gennodejs progetto_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS progetto_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto
)
_generate_srv_py(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto
)
_generate_srv_py(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto
)
_generate_srv_py(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto
)
_generate_srv_py(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto
)
_generate_srv_py(progetto
  "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto
)

### Generating Module File
_generate_module_py(progetto
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(progetto_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(progetto_generate_messages progetto_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/VoiceDetectionService.srv" NAME_WE)
add_dependencies(progetto_generate_messages_py _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/WakeUp.srv" NAME_WE)
add_dependencies(progetto_generate_messages_py _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Rest.srv" NAME_WE)
add_dependencies(progetto_generate_messages_py _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/Text2Speech.srv" NAME_WE)
add_dependencies(progetto_generate_messages_py _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StartAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_py _progetto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/domenico/Scrivania/prova_ros/workspace/src/progetto/srv/StopAwareness.srv" NAME_WE)
add_dependencies(progetto_generate_messages_py _progetto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(progetto_genpy)
add_dependencies(progetto_genpy progetto_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS progetto_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/progetto
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(progetto_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/progetto
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(progetto_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/progetto
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(progetto_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/progetto
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(progetto_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/progetto
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(progetto_generate_messages_py std_msgs_generate_messages_py)
endif()
