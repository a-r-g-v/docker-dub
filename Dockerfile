FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y wget  && \
    wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list

RUN apt-get -y update  && apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring 

RUN apt-get install --force-yes -y dub libcurl4-gnutls-dev libevent-dev libssl-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
