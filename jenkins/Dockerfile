FROM jenkins/jenkins:latest

USER root

# Deactivate Jenkins Wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /config/casc_config.yml

# Install tools and dependencies
RUN apt-get update \
    && apt-get install \
    apt-utils \
    software-properties-common \
    curl \
    wget \
    sudo \
    git \
    apt-transport-https \
    net-tools \
    -y --allow-unauthenticated \
    && rm -rf /var/lib/apt/lists/*

# Permission to Jenkins to be allowed running the host's Docker
RUN adduser jenkins sudo
RUN sudo groupadd docker
RUN sudo usermod -a -G docker jenkins

USER jenkins

# Install Jenkins plugins
# Note:
# Ideally, we'd like to pass the plugins as argument individually
# instead of a file as any changes to the plugins list should trigger
# the docker build of this layer which is not the case here.
COPY ./config/plugins.txt /config/
RUN jenkins-plugin-cli --plugin-file /config/plugins.txt

# Add CASC config file
COPY ./config/casc_config.yml /config/

# Copy Jobs DSL seed
COPY ./config/seed_jobs.groovy /config/

WORKDIR ${JENKINS_HOME}