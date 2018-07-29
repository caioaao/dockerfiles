ARG BASE_IMAGE
FROM $BASE_IMAGE

ENV HOME /root

ARG USE_GPU
ENV USE_GPU $USE_GPU
ENV NCCL_VERSION 2.2.12

# args to skip any interactive post-install configuration steps
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

COPY install_deps.sh /tmp/install_deps.sh
RUN /tmp/install_deps.sh

# installing node 8.x to be able to install jupyterlab extensions
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN pip install --upgrade pip

COPY requirements.txt /tmp/requirements.txt
# To force ordering, otherwise I can't make Cython come before bhtsne
RUN cat /tmp/requirements.txt | xargs -n 1 -L 1 pip install

COPY xgb.sh /tmp/xgb.sh
RUN /tmp/xgb.sh

COPY lightgbm.sh /tmp/lightgbm.sh
RUN /tmp/lightgbm.sh

RUN npm install --save-dev webpack

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter labextension install jupyterlab-toc
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@0.35

WORKDIR /project

VOLUME /project
VOLUME /datasets

CMD ["bash"]
