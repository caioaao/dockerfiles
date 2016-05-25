FROM caio.ros:rosx11

RUN apt-get update && apt-get install -y ros-indigo-stage-ros

WORKDIR "/opt/ros/indigo/share/stage_ros/world"

CMD ["rosrun", "stage_ros", "stageros", "willow-erratic.world"]
