#!groovy

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

// Create local Jenkins user
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("shriyashsawant", "Shriyash@2004")
instance.setSecurityRealm(hudsonRealm)

// Authorization
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)

instance.save()
