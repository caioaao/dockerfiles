FROM tensorflow/tensorflow:1.4.0-gpu-py3

ENV HOME /root

RUN apt-get update && apt-get install -y gcc libc-dev libffi-dev g++ python-dev

RUN pip install Cython

RUN pip install joblib xgboost sklearn pandas bhtsne keras seaborn requests tqdm

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

WORKDIR /project

VOLUME /project
VOLUME /datasets

CMD ["bash"]
