#!/bin/bash

# Based on the host's settings, the following line might be necessary
# to execute in order to finish the docker setup inside the container.
# And it does the following:
# - creates a 'docker' group in the container
# - adds 'jenkins' user to it
# - changes /var/run/docker.sock we mapped to 'docker' group
docker exec -itd -u root jenkins-coolest-game /bin/bash 'getent group docker || groupadd docker && usermod -aG docker jenkins && chgrp docker /var/run/docker.sock'