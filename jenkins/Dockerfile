FROM jenkins/jenkins:latest

USER root

RUN apt-get update
RUN apt-get install ldap-utils curl wget vim nano sudo git iptables -y --allow-unauthenticated

RUN adduser jenkins sudo

# Deactivate Jenkins Wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install Jenkins plugins
USER jenkins

COPY plugins.txt ./
RUN jenkins-plugin-cli --plugin-file plugins.txt
# Note: Ideally, we'd like to pass the plugins as argument individually
# instead of a file as any changes to the plugins list should trigger
# the docker build of this layer which is not the case here.
