#FROM ubuntu:14.04.2
FROM phusion/baseimage:0.9.16

USER shippable

RUN apt-get update && apt-get install -y pypy wget git
RUN mkdir /pypytmp
RUN wget -P /pypytmp https://raw.github.com/pypa/pip/master/contrib/get-pip.py
RUN pypy /pypytmp/get-pip.py
RUN rm -rf /pypytmp
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD . /home/wrk

WORKDIR /home/wrk

#CMD ["/bin/bash", "boot.sh"]

EXPOSE 3000
