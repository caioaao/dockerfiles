FROM caioaao/ml-base-gpu:1.1.1

RUN apt-get update && apt-get install -y git

RUN cd /tmp && \
    git clone https://github.com/caioaao/scikit-learn.git && \
    cd scikit-learn && \
    git checkout stacking-classifier && \
    pip install --upgrade .
