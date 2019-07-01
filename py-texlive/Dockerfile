FROM python:3.6.8-stretch

RUN apt-get update
RUN apt-get install -y texlive-full

RUN pip install jinja2

RUN useradd -u 1000 texuser

WORKDIR /project
VOLUME /project

CMD ["sh"]
