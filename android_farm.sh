x=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
export ROS_IP=$x
THISDIR=${PWD}
red=`tput setaf 1`
reset=`tput sgr0`

echo "==============="
echo "Add this IP to the application's Robot, instead of localhost:"
echo ${red}$x${reset}
echo "==============="
echo ""

runGazebo() {
    cd $THISDIR
    chmod 0755 libs/gazebo_farm.sh
    cd libs
    gnome-terminal -e "./gazebo_farm.sh"
    cd $THISDIR
    #sleep 3
  #  gnome-terminal -e "roslaunch husky_viz view_robot.launch" 
   # gnome-terminal -e "roslaunch husky_navigation amcl_demo.launch" 
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


echo ""
echo ""
select run in "Run Gazebo and proprietary apps" "Show ROS Control required topics" "Clean all windows" "Exit"; do
	case $run in
		"Run Gazebo and proprietary apps" ) clean; runGazebo; anythingElse; break;;
		"Show ROS Control required topics" ) showTopics; anythingElse; break;;
		"Clean all windows" ) clean; anythingElse; break;;
		"Exit" ) exit 0; break;;
	esac
done
exit 0
