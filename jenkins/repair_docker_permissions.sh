#!/bin/bash

# Based on the host's settings, the following line might be necessary
# to execute in order to finish the docker setup inside the container.
# And it does the following:
# - creates a 'docker' group in the container
# - adds 'jenkins' user to it
# - changes /var/run/docker.sock we mapped to 'docker' group
docker exec -u root jenkins-coolest-game /bin/bash -c "getent group docker || groupadd docker && sudo chgrp docker /var/run/docker.sock"