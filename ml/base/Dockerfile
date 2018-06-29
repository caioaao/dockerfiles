ARG BASE_IMAGE
FROM $BASE_IMAGE

ENV HOME /root

RUN apt-get update && apt-get install -y gcc libc-dev libffi-dev g++ python-dev

COPY requirements.txt /tmp/requirements.txt

# To force ordering, otherwise I can't make Cython come before bhtsne

RUN cat /tmp/requirements.txt | xargs -n 1 -L 1 pip install

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

WORKDIR /project

VOLUME /project
VOLUME /datasets

CMD ["bash"]
