#!/bin/bash

# Fix volume permissions at runtime
echo "🔧 Fixing permissions on /var/jenkins_home..."
chown -R jenkins:jenkins /var/jenkins_home || echo "⚠️ Could not chown /var/jenkins_home"

# Run Jenkins as jenkins user
echo "🚀 Starting Jenkins..."
exec su jenkins -c "/usr/local/bin/jenkins.sh"
