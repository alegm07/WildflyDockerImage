#!/bin/sh

if [ -n "$WILDFLY_USER" ] && [ -n "$WILDFLY_PASSWORD" ]; then
    echo -n "$WILDFLY_USER:ManagementRealm:$WILDFLY_PASSWORD" | md5sum | cut -d ' ' -f 1 | awk -v user="$WILDFLY_USER" '{print user "=" $1}' >> /opt/wildfly/standalone/configuration/mgmt-users.properties
fi

# Ejecutar el comando CMD del Dockerfile
exec "$@"