#!/bin/bash
#
# Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

# Build ROS dependency
echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
source /opt/ros/${ROS_DISTRO}/setup.bash

# Ardupilot_ws -------------------
cd /workspaces/ardupilot_ws/ && rosdep install -r --from-paths src -i -y --rosdistro humble && 
export PATH=$PATH:/workspaces/ardupilot_ws/src/Micro-XRCE-DDS-Gen/scripts
export PATH=$PATH:/workspaces/ardupilot_ws/src/ardupilot/Tools/autotest
# colcon build
. install/setup.bash
cd /workspaces/sapience_nvidia_devel
# --------------------------------

# Sapience Devel ws --------------
sudo apt-get update
rosdep update
export GZ_VERSION=garden
rosdep install -r --from-paths src -i -y --rosdistro humble
# --------------------------------

# Return to starting point
cd /workspaces/sapience_nvidia_devel
source install/setup.bash
source ../ardupilot_ws/install/setup.bash

#install geographic bullshit with root privileges
sudo ./src/isaac_ros_common/install_geographiclib_datasets.sh

# Restart udev daemon
sudo service udev restart

$@
