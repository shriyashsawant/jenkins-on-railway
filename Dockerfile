FROM jenkins/jenkins:lts

# Disable the setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Install required plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Copy your groovy admin initializer
COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/

# ✅ Fix permissions on the mounted volume
USER root
RUN chown -R 1000:1000 /var/jenkins_home
USER jenkins

EXPOSE 8080

