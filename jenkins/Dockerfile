FROM jenkins/jenkins:latest

# Deactivate Jenkins Wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /config/casc_config.yml

USER root
RUN apt-get update \
    && apt-get install apt-utils ldap-utils curl wget vim nano sudo git net-tools -y --allow-unauthenticated \
    && rm -rf /var/lib/apt/lists/*

RUN adduser jenkins sudo

USER jenkins

# Install Jenkins plugins
# Note:
# Ideally, we'd like to pass the plugins as argument individually
# instead of a file as any changes to the plugins list should trigger
# the docker build of this layer which is not the case here.
COPY plugins.txt /config/
RUN jenkins-plugin-cli --plugin-file /config/plugins.txt

# Add CASC config file
COPY casc_config.yml /config/