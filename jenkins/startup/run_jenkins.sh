#!/bin/bash

export JENKINS_HOME="data"

# Create a local Jenkins data folder to persist its configuration
if [ ! -d "${JENKINS_HOME}" ]; then mkdir ${JENKINS_HOME}; fi

# Build
docker build -t jenkins:jcasc -f .

# Run Jenkins on port 8080
docker run --name jenkins-coolest-game \
            --privileged \
            --rm -p 8080:8080 \
            --env JENKINS_ADMIN_ID="admin" --env JENKINS_ADMIN_PASSWORD="p@55w0rd" \
            -e git_token=${git_token} \
            -v $(pwd)/${JENKINS_HOME}:/var/jenkins_home \
            -v $(which docker):/usr/bin/docker \
            -v /var/run/docker.sock:/var/run/docker.sock \
            jenkins:jcasc