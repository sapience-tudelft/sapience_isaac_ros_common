#!/bin/bash

# Setup the SAPIENCE environment
# Assumes github SSH key setup


export DIRECTORY_PATH=${HOME}/workspaces/sapience_nvidia_devel
export COPTER_TAG=Copter-4.4

####### Make directories
mkdir -p ${DIRECTORY_PATH}/src
cd ${DIRECTORY_PATH}/src


####### Cloning Repos

# Clone the isaac_ros_common repo
git clone git@github.com:maximecapelle/sapience_isaac_ros_common.git isaac_ros_common
cd isaac_ros_common && git submodule update --init --recursive && cd ..

# Clone the isaac_ros_nvblox repo
git clone --recurse-submodules git@github.com:maximecapelle/sapience_isaac_ros_nvblox.git isaac_ros_nvblox
cd isaac_ros_nvblox && git lfs pull && cd ..

# Clone the ros gazebo repo
git clone -b humble https://github.com/gazebosim/ros_gz.git
cd ros_gz && git submodule update --init --recursive && cd ..

# Clone the Sapience repo
git clone -b ros2_migration git@github.com:tudelft/SAPIENCE.git
cd SAPIENCE && git submodule update --init --recursive && cd ..

# Clone GPS package
git clone -b ros2_devel git@github.com:swri-robotics/gps_umd.git
cd gps_umd && git submodule update --init --recursive && cd ..

## Clone ardupilot without building
#cd ${DIRECTORY_PATH}
#git clone https://github.com/ArduPilot/ardupilot.git ardupilot
#cd ardupilot
#git checkout ${COPTER_TAG}
#git submodule update --init --recursive

####### Setting up paths and aliases

export ISAAC_ROS_WS=${DIRECTORY_PATH}
source ~/.bashrc

echo "export ISAAC_ROS_WS=${ISAAC_ROS_WS}" >> ~/.bashrc
echo "alias launch_sapience_docker='cd ${ISAAC_ROS_WS}/src/isaac_ros_common && ./scripts/run_dev.sh ${ISAAC_ROS_WS}'" >> ~/.bashrc
source ~/.bashrc

echo ""
echo "Environment was set up successfully!"
echo "Restart the terminal window and you can now use 'launch_sapience_docker' to start the docker environment"

