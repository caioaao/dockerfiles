FROM tensorflow/tensorflow:1.3.0

ENV HOME /root

RUN apt-get update && apt-get install -y gcc libc-dev libffi-dev g++

RUN pip install Cython

RUN pip install joblib xgboost sklearn pandas bhtsne keras seaborn requests tqdm

WORKDIR /project

VOLUME /project
VOLUME /datasets

CMD ["bash"]
