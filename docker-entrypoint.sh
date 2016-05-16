#!/bin/bash

set -e

# -autoDiscoveryAddress VAL      : Use this address for udp-based auto-discovery
#                                  (default 255.255.255.255)
# -candidateTag VAL              : Show swarm candidate with tag only
# -description VAL               : Description to be put on the slave
# -disableClientsUniqueId        : Disables Clients unique ID.
# -disableSslVerification        : Disables SSL verification in the HttpClient.
# -executors N                   : Number of executors
# -fsroot FILE                   : Directory where Jenkins places files
# -help (--help)                 : Show the help screen
# -labels VAL                    : Whitespace-separated list of labels to be
#                                  assigned for this slave. Multiple options are
#                                  allowed.
# -master VAL                    : The complete target Jenkins URL like
#                                  'http://server:8080/jenkins/'. If this option
#                                  is specified, auto-discovery will be skipped
# -mode MODE                     : The mode controlling how Jenkins allocates
#                                  jobs to slaves. Can be either 'normal'
#                                  (utilize this slave as much as possible) or
#                                  'exclusive' (leave this machine for tied jobs
#                                  only). Default is normal.
# -name VAL                      : Name of the slave
# -noRetryAfterConnected         : Do not retry if a successful connection gets
#                                  closed.
# -password VAL                  : The Jenkins user password
# -passwordEnvVariable VAL       : Environment variable that the password is
#                                  stored in
# -retry N                       : Number of retries before giving up. Unlimited
#                                  if not specified.
# -showHostName (--showHostName) : Show hostnames instead of IP address
# -t (--toolLocation)            : A tool location to be defined on this slave.
#                                  It is specified as 'toolName=location'
# -tunnel VAL                    : Connect to the specified host and port,
#                                  instead of connecting directly to Jenkins.
#                                  Useful when connection to Hudson needs to be
#                                  tunneled. Can be also HOST: or :PORT, in
#                                  which case the missing portion will be
#                                  auto-configured like the default behavior
# -username VAL                  : The Jenkins username for authentication

ARGS=""

if [ ! -z $JENKINS_MASTER ]; then
  ARGS="${ARGS} -master ${JENKINS_MASTER}"
fi

if [ ! -z $NUM_EXECUTORS ]; then
  ARGS=${ARGS} -executors ${NUM_EXECUTORS}"
fi

if [ ! -z $JENKINS_USER ]; then
  if [ ! -z $PASSWORD_ENV_VARIABLE ]; then
    ARGS="${ARGS} -username ${JENKINS_USER} -passwordEnvVariable ${PASSWORD_ENV_VARIABLE}"
  fi
fi

if [ ! -z $DISABLE_SSL_VERIFICATION ]; then
  ARGS="${ARGS} -disableSslVerification" 
fi

if [ ! -z $ARGS ]; then
  exec /usr/bin/java -jar /apps/jenkins/swarm-client.jar $ARGS
else
  exec /usr/bin/java -jar /apps/jenkins/swarm-client.jar "$@"
fi

