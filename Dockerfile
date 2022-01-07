FROM frankjoshua/ros2

# ** [Optional] Uncomment this section to install additional packages. **
#
USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y install --no-install-recommends build-essential libboost-system-dev libboost-thread-dev libboost-program-options-dev libboost-test-dev sudo\
   #
   # Clean up
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

# Set up auto-source of workspace for ros user
ARG WORKSPACE=/home/ros
USER ros
WORKDIR ${WORKSPACE}
SHELL [ "/bin/bash", "-i", "-c" ]
RUN git clone -b main https://github.com/robo-friends/m-explore-ros2.git src/m-explore-ros2 \
        && sudo apt-get update && rosdep update && rosdep install --from-paths src --ignore-src -y \
        && rosdep install --from-path src --ignore-src -y \
        && colcon build 

RUN echo "if [ -f ${WORKSPACE}/install/setup.bash ]; then source ${WORKSPACE}/install/setup.bash; fi" >> /home/ros/.bashrc

# # nvidia-container-runtime
# ENV NVIDIA_VISIBLE_DEVICES \
#     ${NVIDIA_VISIBLE_DEVICES:-all}
# ENV NVIDIA_DRIVER_CAPABILITIES \
#     ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENTRYPOINT [ "/bin/bash", "-i", "-c" ]
CMD ["ros2 launch explore_lite explore.launch.py"]