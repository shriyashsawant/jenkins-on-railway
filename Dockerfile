FROM jenkins/jenkins:lts

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Copy admin auto-creation
COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/

# ✅ Switch to root to fix volume permissions
USER root

# 👇 Entrypoint script to fix perms at container start
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# ✅ Run as root at startup
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash", "-c", "/usr/bin/tini -- /usr/local/bin/jenkins.sh"]

EXPOSE 8080


