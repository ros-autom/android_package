#!/bin/bash
sudo killall gzserver
sudo killall gzclient
sudo killall rviz
sudo killall roscore
sudo killall rosmaster
sudo killall rosout
sudo killall python
sudo killall roslaunch
sudo killall tf2_relay_node
sudo killall twist_mux
sudo killall robot_state_publisher
sudo killall master_sync
sudo killall message_relay_node
sudo killall move_base
sudo killall map_server
sudo killall static_transform_publisher

gnome-terminal -e "roslaunch husky_gazebo husky_farm.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true"

sleep 3
gnome-terminal -e "roslaunch find_object_2d find_object_3d.launch static_objects:=true sim_mode:=true slam_mode:=true"

sleep 3

gnome-terminal -e "roslaunch husky_viz view_robot.launch"

sleep 3

gnome-terminal -e "roslaunch husky_navigation gmapping_demo.launch"

sleep 3

gnome-terminal -e "rosrun image_transport republish compressed in:=camera/rgb/image_raw out:=image_raw"

"$SHELL"
