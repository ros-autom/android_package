#!/bin/bash

echo $1 | sudo -S  killall gzserver
echo $1 | sudo -S  killall gzclient
echo $1 | sudo -S  killall rviz
echo $1 | sudo -S  killall roscore
echo $1 | sudo -S  killall rosmaster
echo $1 | sudo -S  killall rosout
echo $1 | sudo -S  killall python
echo $1 | sudo -S  killall roslaunch
echo $1 | sudo -S  killall tf2_relay_node
echo $1 | sudo -S  killall twist_mux
echo $1 | sudo -S  killall robot_state_publisher
echo $1 | sudo -S  killall master_sync
echo $1 | sudo -S  killall message_relay_node
echo $1 | sudo -S  killall move_base
echo $1 | sudo -S  killall map_server
echo $1 | sudo -S  killall static_transform_publisher
roslaunch husky_gazebo husky_farm.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true
