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

sudo apt-get update
rosdep update

# Gazebo Garden
export GZ_VERSION=garden
rosdep install -r --from-paths src -i -y --rosdistro humble

# # Build packages
# colcon build
# . install/setup.bash

# cd ../ardupilot_gazebo && colcon build
# export GZ_SIM_SYSTEM_PLUGIN_PATH=/workspaces/ardupilot_gazebo/build/ardupilot_gazebo:$GZ_SIM_SYSTEM_PLUGIN_PATH
# cd ../sapience_nvidia_devel

# Restart udev daemon
sudo service udev restart

$@
