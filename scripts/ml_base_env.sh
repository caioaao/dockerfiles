#!/bin/bash

set -euo pipefail

if [[ -n "${WITH_GPU:-}" ]]; then
    DOCKER=nvidia-docker
    DOCKERIMAGE=caioaao/ml-base-gpu
else
    DOCKER=docker
    DOCKERIMAGE=caioaao/ml-base
fi

[[ -n "${CONTAINER_NAME:-}" ]] && NAME_PARAM="--name=${CONTAINER_NAME}"

$DOCKER run -it --rm ${NAME_PARAM:-}  ${EXTRA_ARGS:-}   \
        -v "$(pwd):/project"                            \
        -v "${DATASETS_DIR:-$(pwd)/datasets}:/datasets" \
        $DOCKERIMAGE "${@:1}"
