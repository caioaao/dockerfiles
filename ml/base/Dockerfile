ARG BASE_IMAGE
FROM $BASE_IMAGE

ENV HOME /root

ARG USE_GPU
ENV USE_GPU $USE_GPU
ENV NCCL_VERSION 2.2.12

RUN apt-get update && apt-get install -y  --no-install-recommends \
        gcc libc-dev libffi-dev g++ python-dev npm wget cmake git \
        python3-setuptools \
        cuda-libraries-$CUDA_PKG_VERSION \
        libnccl2=$NCCL_VERSION-1+cuda9.0 \
        cuda-libraries-dev-$CUDA_PKG_VERSION \
        cuda-nvml-dev-$CUDA_PKG_VERSION \
        cuda-minimal-build-$CUDA_PKG_VERSION \
        cuda-core-9-0=9.0.176.3-1 \
        cuda-cublas-dev-9-0=9.0.176.3-1 \
        libnccl-dev=$NCCL_VERSION-1+cuda9.0 && \
    rm -rf /var/lib/apt/lists/*



# installing node 8.x to be able to install jupyterlab extensions
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

COPY requirements.txt /tmp/requirements.txt
# To force ordering, otherwise I can't make Cython come before bhtsne
RUN cat /tmp/requirements.txt | xargs -n 1 -L 1 pip install

COPY xgb.sh /tmp/xgb.sh
RUN /tmp/xgb.sh

RUN npm install --save-dev webpack

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter labextension install jupyterlab-toc
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

WORKDIR /project

VOLUME /project
VOLUME /datasets

CMD ["bash"]
