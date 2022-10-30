#!/bin/bash

export JENKINS_HOME="jenkins_data"

# Create a local Jenkins data folder to persist its configuration
if [ ! -d "${JENKINS_HOME}" ]; then mkdir ${JENKINS_HOME}; fi

# Build
docker build -t jenkins:jcasc .

# Run Jenkins on port 8080
docker run --name jenkins-coolest-game \
            --privileged \
            --rm -p 8080:8080 \
            --env JENKINS_ADMIN_ID="admin" --env JENKINS_ADMIN_PASSWORD="p@55w0rd" \
            -v $(pwd)/${JENKINS_HOME}:/var/jenkins_home \
            -v $(which docker):/usr/bin/docker \
            -v /var/run/docker.sock:/var/run/docker.sock \
            jenkins:jcasc