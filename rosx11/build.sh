# Generating docker.xauth (see http://stackoverflow.com/a/25280523)
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f docker.xauth nmerge -

sudo docker build -t caio.ros:rosx11 .
