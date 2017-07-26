
THISDIR=${PWD}

runGazebo() {
    cd $THISDIR
    read -s -p "Enter Password for sudo: " sudoPW

    sudo chmod 0755 libs/gazebo_farm.sh
    cd libs
    gnome-terminal -e "./gazebo_farm.sh ${sudoPW}"
    cd $THISDIR
    sleep 3
    gnome-terminal -e "roslaunch husky_viz view_robot.launch" 
    gnome-terminal -e "roslaunch husky_navigation amcl_demo.launch" 
    gnome-terminal -e "rosrun image_transport republish compressed in:=camera/rgb/image_raw out:=image_raw"
}

clean() {
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
}

showTopics() {
   cd $THISDIR
   sudo chmod 0755 libs/showTopics.sh
   cd libs
   gnome-terminal -e "./showTopics.sh"
   cd $THISDIR
   
}
addHost() {
   cd $THISDIR
   sudo chmod 777 libs/addHost
   cd $THISDIR && cd libs
   gnome-terminal -e "./addHost"
}
anythingElse() {
    echo " "
    echo " "
    echo "Anything else?"
    select more in "Yes" "No"; do
        case $more in
            Yes ) bash ${THISDIR}/android.sh; break;;
            No ) exit 0; break;;
        esac
    done ;
}



select run in "Run Gazebo and proprietary apps" "Show ROS Control required topics" "Add Android's device host name to ROS computer" "Clean all windows" "Exit"; do
	case $run in
		"Run Gazebo and proprietary apps" ) runGazebo; anythingElse; break;;
		"Clean all windows" ) clean; anythingElse; break;;
		"Add Android's device host name to ROS computer" ) addHost; anythingElse; break;;
		"Show ROS Control required topics" ) showTopics; anythingElse; break;;
		"Exit" ) exit 0; break;;
	esac
done
exit 0
