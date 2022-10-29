#!/bin/bash

export JENKINS_HOME="jenkins_data"
export WORKDIR="build"

# Create a local Jenkins data folder to persist its configuration
if [ ! -d "${JENKINS_HOME}" ]; then mkdir ${JENKINS_HOME}; fi

# Build
docker build -t jenkins:jcasc .

# Run Jenkins on port 8080
docker run --name jenkins --rm -p 8080:8080 \
           -v $(pwd)/${JENKINS_HOME}:/var/jenkins_home \
           -v $(pwd)/${WORKDIR}:/${WORKDIR} \
           -v /var/run/docker.sock:/var/run/docker.sock \
           jenkins:jcasc