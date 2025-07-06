FROM jenkins/jenkins:lts

# Disable setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Add plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Add init script to auto-create admin
COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/

EXPOSE 8080
