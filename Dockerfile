# Use official ROS Noetic Desktop Full image
FROM osrf/ros:noetic-desktop-full

# Install MoveIt and some common tools
RUN apt-get update && apt-get install -y \
    ros-noetic-moveit \
    ros-noetic-moveit-visual-tools \
    ros-noetic-rviz \
    && rm -rf /var/lib/apt/lists/*

# Automatically source ROS when logging in
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc

CMD ["bash"]
