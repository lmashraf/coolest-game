FROM ubuntu:latest

# Ensure the package repository is up-to-date
RUN sed -i 's/main$/main universe/' /etc/apt/sources.list
RUN dpkg --add-architecture i386
RUN apt-get -qq update && apt-get -qqy dist-upgrade

# Install essential packages
RUN apt-get -y install \
    build-essential \
    cmake \
    python2 \
    gdb \
    unzip \
    tar \
    --no-install-recommends

RUN rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]