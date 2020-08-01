FROM i386/ubuntu:20.04
MAINTAINER Ryan Clouser (me@ryanclouser.com)

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV USER docker

ENV SOF2_CONFIG "server.cfg"
ENV SOF2_GAME ""

RUN useradd -ms /bin/bash docker
WORKDIR /home/docker

RUN apt update && apt install libz1 libncurses5 -qy && apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /home/docker/base
RUN mkdir /home/docker/pb

COPY --chown=docker base/* /home/docker/base/
COPY --chown=docker pb/* /home/docker/pb/
COPY --chown=docker sof2ded /home/docker/
COPY --chown=docker start.sh /home/docker/
COPY libcxa.so.1 /usr/lib/

USER docker

RUN chmod +x /home/docker/sof2ded
RUN chmod +x /home/docker/start.sh

EXPOSE 20100/udp

ENTRYPOINT ["/home/docker/start.sh"]
