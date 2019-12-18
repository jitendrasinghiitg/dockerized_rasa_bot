FROM ubuntu:18.04
MAINTAINER Jitendra Singh

RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install -U pip
RUN pip3 install rasa[spacy]==1.5.3
RUN python3 -m spacy download en_core_web_md
RUN python3 -m spacy link en_core_web_md en

ADD ./models /app/models/
ADD ./config /app/config/
ADD ./actions /app/actions/
ENTRYPOINT []