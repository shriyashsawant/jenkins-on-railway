#!/bin/bash

# Fix volume permissions at runtime
echo "🔧 Fixing permissions on /var/jenkins_home..."
chown -R jenkins:jenkins /var/jenkins_home || echo "⚠️ Could not chown /var/jenkins_home"

# Set Java memory options to reduce RAM usage
export JAVA_OPTS="-Xms128m -Xmx256m"

# Run Jenkins with memory limits
echo "🚀 Starting Jenkins with memory limits..."
exec su jenkins -c "/usr/local/bin/jenkins.sh"

