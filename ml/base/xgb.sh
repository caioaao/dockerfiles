#!/usr/bin/env bash

set -euo pipefail

EXTRA_BUILD_OPTS="-DUSE_NCCL=ON"
if [[ "$USE_GPU" = true ]]; then
    EXTRA_BUILD_OPTS="${EXTRA_BUILD_OPTS} -DUSE_CUDA=ON"
fi

mkdir /tmp || true
cd /tmp

git clone --branch v0.72 --recursive https://github.com/dmlc/xgboost

cd xgboost
mkdir build
cd build
cmake .. ${EXTRA_BUILD_OPTS:-}
make -j
make install

cd ../python-package
python3 setup.py install
