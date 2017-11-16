#!/bin/bash

#roslaunch husky_gazebo husky_farm.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true

gnome-terminal -e "roslaunch husky_gazebo husky_warehouse.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true"

#sleep 3
#gnome-terminal -e "roslaunch find_object_2d find_object_3d.launch static_objects:=true sim_mode:=true slam_mode:=true"

sleep 3

gnome-terminal -e "roslaunch husky_viz view_robot.launch"

sleep 3

gnome-terminal -e "roslaunch husky_navigation amcl_demo.launch"

#sleep 3

#gnome-terminal -e "roslaunch husky_control husky_teleop.launch"

#sleep 3

#gnome-terminal -e "roslaunch visp_auto_tracker tracklive_husky.launch"

#sleep 3

#gnome-terminal -e "rostopic echo /visp_auto_tracker/code_message"

