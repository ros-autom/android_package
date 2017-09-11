#!/bin/bash

   ps aux | grep -ie gzserver | awk '{print $2}' | xargs kill -9  || true
    ps aux | grep -ie gzclient | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie rviz | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie roscore | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie rosmaster | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie rosout | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie roslaunch | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie tf2_relay_node | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie twist_mux | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie robot_state_publisher | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie master_sync | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie message_relay_node | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie move_base | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie map_server | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie static_transform_publisher | awk '{print $2}' | xargs kill -9   || true
    ps aux | grep -ie amcl | awk '{print $2}' | xargs kill -9   || true

roslaunch nre_simmultihusky autom_multihusky_karto.launch 
