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

# # Gazebo Garden
# export GZ_VERSION=garden
# rosdep install -r --from-paths src -i -y --rosdistro humble

# # MAVROS
# cd /workspaces/sapience_nvidia_devel
# sudo apt install -y python3-vcstool python3-rosinstall-generator python3-osrf-pycommon
# rosinstall_generator --format repos mavlink | tee /tmp/mavlink.repos
# rosinstall_generator --format repos --upstream mavros | tee -a /tmp/mavros.repos
# vcs import src < /tmp/mavlink.repos
# vcs import src < /tmp/mavros.repos
# rosdep update && rosdep install -y -i --from-paths src
# rosdep install --from-paths ${ROS_WORKSPACE} --ignore-src --rosdistro=${ROSDISTRO}
# sudo ./src/mavros/mavros/scripts/install_geographiclib_datasets.sh
# colcon build --packages-select mavros mavlink


# colcon build
# . install/setup.bash

# pip install pexpect pymavlink


# Restart udev daemon
sudo service udev restart

$@
