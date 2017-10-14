#!/bin/bash

set -euo pipefail

if [[ -n "${WITH_GPU:-}" ]]; then
    DOCKER=nvidia-docker
    DOCKERIMAGE="${DOCKERIMAGE:-caioaao/ml-base-gpu}"
else
    DOCKER=docker
    DOCKERIMAGE="${DOCKERIMAGE:-caioaao/ml-base}"
fi

[[ -n "${CONTAINER_NAME:-}" ]] && NAME_PARAM="--name=${CONTAINER_NAME}"
[[ -z "${TENSORBOARD_PORT:-}" ]] && TENSORBOARD_PORT=8888

$DOCKER run -it --rm ${NAME_PARAM:-}  ${EXTRA_ARGS:-}   \
        -v "$(pwd):/project"                            \
        -v "${DATASETS_DIR:-$(pwd)/datasets}:/datasets" \
        -p "${TENSORBOARD_PORT}:8888"                   \
        $DOCKERIMAGE "${@:1}"
