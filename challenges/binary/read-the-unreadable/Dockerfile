FROM ubuntu:18.04
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libc6:i386
RUN apt-get install -y nmap

RUN adduser player
COPY * /
WORKDIR /

EXPOSE 2525
USER player
CMD ncat -l -k -p 2525 -e fs
