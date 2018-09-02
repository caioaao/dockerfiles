set -euo pipefail

# Generating docker.xauth (see http://stackoverflow.com/a/25280523)
XAUTH_FILE=docker.xauth
touch $XAUTH_FILE
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH_FILE nmerge -

sudo docker build -t caio.ros:rosx11 .
