red=`tput setaf 1`
reset=`tput sgr0`

 echo ""
 echo "Use the following topics on ROS Control android app:"
 echo ""
 echo "Joystick topic: ${red}/cmd_vel${reset}"
 echo "Laser Scan: ${red}/scan${reset}"
 echo "Image Topic: ${red}/image_raw/compressed${reset}"
 echo "GPS Topic: ${red}/navsat/fix NOT USED AT SIMULATIONS${reset}"
 echo "Odometry Topic: ${red}/odometry/filtered${reset}"
 echo "Pose Topic: ${red}/pose${reset}"
 cd ..
 

 echo ""
"$SHELL"
