#!/usr/bin/env bash

set -euo pipefail

# basic packages
PACKAGES="gcc libc-dev libffi-dev g++ python-dev npm wget cmake git python3-setuptools"

# necessary for lightgbm
PACKAGES="${PACKAGES} libboost-dev libboost-system-dev libboost-filesystem-dev openmpi-bin libopenmpi-dev swig libpulse-dev"

if [ "$USE_GPU" = true ]; then
    # XGB with GPU
    PACKAGES="${PACKAGES} cuda-libraries-$CUDA_PKG_VERSION libnccl2=$NCCL_VERSION-1+cuda9.0 cuda-libraries-dev-$CUDA_PKG_VERSION cuda-nvml-dev-$CUDA_PKG_VERSION cuda-minimal-build-$CUDA_PKG_VERSION cuda-core-9-0=9.0.176.3-1 cuda-cublas-dev-9-0=9.0.176.3-1 libnccl-dev=$NCCL_VERSION-1+cuda9.0"
fi

add-apt-repository -y ppa:jonathonf/python-3.5 # python 3.5.3 so I can use altair...
apt-get update
apt-get install -y --no-install-recommends --only-upgrade python3.5=3.5.3*
apt-get install -y --no-install-recommends ${PACKAGES}
rm -rf /var/lib/apt/lists/*
