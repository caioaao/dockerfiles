#!/usr/bin/env bash

set -euo pipefail

# error logs from using pip were awful and compiling it from scratch was easier
# to debug

EXTRA_BUILD_OPTS="-DUSE_MPI=ON"
EXTRA_MAKE_OPTS=""

if [ "$USE_GPU" = true ]; then
    EXTRA_BUILD_OPTS="${EXTRA_BUILD_OPTS} -DUSE_GPU=1 -DOpenCL_LIBRARY=/usr/local/cuda/lib64/libOpenCL.so -DOpenCL_INCLUDE_DIR=/usr/local/cuda/include/"
    EXTRA_MAKE_OPTS="${EXTRA_MAKE_OPTS} OPENCL_HEADERS=/usr/local/cuda-9.0/targets/x86_64-linux/include LIBOPENCL=/usr/local/cuda-9.0/targets/x86_64-linux/lib"
fi



mkdir -p /usr/local/src || true
cd /usr/local/src

git clone --branch v2.1.2 --recursive https://github.com/Microsoft/LightGBM

# Add OpenCL ICD files for LightGBM
mkdir -p /etc/OpenCL/vendors
echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

cd LightGBM
mkdir build && cd build

cmake ${EXTRA_BUILD_OPTS:-}  ..

make -j4 ${EXTRA_MAKE_OPTS}

cd ../python-package
python3 setup.py install --precompile
