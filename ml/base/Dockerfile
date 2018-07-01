ARG BASE_IMAGE
FROM $BASE_IMAGE

ENV HOME /root

RUN apt-get update && apt-get install -y gcc libc-dev libffi-dev g++ python-dev npm

# installing node 8.x to be able to install jupyterlab extensions
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

COPY requirements.txt /tmp/requirements.txt

# To force ordering, otherwise I can't make Cython come before bhtsne

RUN cat /tmp/requirements.txt | xargs -n 1 -L 1 pip install

RUN npm install --save-dev webpack

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter labextension install jupyterlab-toc

WORKDIR /project

VOLUME /project
VOLUME /datasets

CMD ["bash"]
