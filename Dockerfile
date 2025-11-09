# Use official ROS Noetic Desktop Full image
FROM osrf/ros:noetic-desktop-full

# Install MoveIt and some common tools
RUN apt-get update && apt-get install -y \
    ros-noetic-moveit \
    ros-noetic-moveit-visual-tools \
    ros-noetic-rviz \
    ros-noetic-effort-controllers \
    ros-noetic-position-controllers \
    ros-noetic-joint-trajectory-controller \
    ros-noetic-ros-controllers \
    ros-noetic-gazebo-ros-control \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Conan (exact version required by ros_kortex)
RUN python3 -m pip install conan==1.59

# Configure Conan
RUN conan config set general.revisions_enabled=1 \
    && conan profile new default --detect \
    && conan profile update settings.compiler.libcxx=libstdc++11 default

# Automatically source ROS when logging in
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc

CMD ["bash"]

