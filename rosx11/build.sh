# Generating docker.xauth (from http://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container)
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f docker.xauth nmerge -

sudo docker build -t caio.ros:rosx11 .
