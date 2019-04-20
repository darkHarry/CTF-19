FROM ubuntu:18.04
RUN apt-get update

RUN adduser player
COPY * /
WORKDIR /

EXPOSE 8888
USER player
CMD ./buster
