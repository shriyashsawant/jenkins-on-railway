#!groovy

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

def user = 'shriyashsawant'
def password = 'Shriyash@2004'

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(user, password)
instance.setSecurityRealm(hudsonRealm)

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)

instance.save()
