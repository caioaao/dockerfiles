FROM caioaao/ml-base-gpu:2.1.0

RUN apt-get install -y \
        wget \
        cmake \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavcodec-dev \
        libavformat-dev \
        libhdf5-dev \
        libpq-dev \
        libgtk2.0-dev

RUN cd /tmp \
    && wget https://github.com/opencv/opencv/archive/3.3.0.zip \
    && unzip 3.3.0.zip \
    && mkdir opencv-3.3.0/cmake_binary \
    && cd opencv-3.3.0/cmake_binary \
    && cmake -DBUILD_TIFF=ON \
        -DBUILD_opencv_java=OFF \
        -DWITH_CUDA=ON \
        -DENABLE_AVX=ON \
        -DWITH_OPENGL=ON \
        -DWITH_OPENCL=ON \
        -DWITH_IPP=ON \
        -DWITH_TBB=ON \
        -DWITH_EIGEN=ON \
        -DWITH_V4L=OFF \
        -DBUILD_TESTS=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=$(python -c "import sys; print(sys.prefix)") \
        -DPYTHON_EXECUTABLE=$(which python) \
        -DPYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -DPYTHON_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
    && make -j7 install

RUN rm -rf /tmp

RUN pip install opencv-python==3.3.0.9 # 3.3.0.10 has Qt dependency that breaks everything :(
