1. ```bash install_reqs.bash```
2. ```catkin build```
3. ```source devel/setup.bash``` each time you have to run a node.
4. ``` roscore ```
5. ```rosrun image_publisher image_publisher test.jpg __name:=testcam```
6. ```rosrun detector detector_node.py image:=/testcam/image_raw```
7. ```rosrun detector visualization_node.py image:=/testcam/image_raw```
