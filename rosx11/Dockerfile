FROM ros:indigo-ros-base

COPY ./docker.xauth /tmp/.docker.xauth
ENV DISPLAY :0
ENV XAUTHORITY /tmp/.docker.xauth

# override this when UID/GID are different from this
ENV UID=1000
