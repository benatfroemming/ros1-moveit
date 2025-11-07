# Start from the full ROS 1 Noetic image
FROM ros:noetic-ros-full

# Install MoveIt and a few common tools
RUN apt-get update && apt-get install -y \
    ros-noetic-moveit \
    ros-noetic-moveit-visual-tools \
    ros-noetic-rviz \
    && rm -rf /var/lib/apt/lists/*

# Source ROS automatically when you open a shell
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc

# Set default shell
CMD ["bash"]
