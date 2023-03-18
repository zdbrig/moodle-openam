#!/bin/bash

# Set variables
OPENAM_ADMIN_PASSWORD=${OPENAM_ADMIN_PASSWORD:-"password"}
OPENAM_CONFIG_DIR=${OPENAM_CONFIG_DIR:-"/opt/openam/config"}
OPENAM_URL="http://localhost:8080/openam"

# Wait for OpenAM to be ready
echo "Waiting for OpenAM to be ready..."
until $(curl --output /dev/null --silent --head --fail "$OPENAM_URL"); do
    sleep 5
done

# Check if OpenAM is configured
CONFIGURED=$(curl -s -I -X GET $OPENAM_URL | grep -c "X-OpenAM-Username")

# Configure OpenAM if not configured
if [ "$CONFIGURED" -eq 0 ]; then
    echo "Configuring OpenAM..."
    /usr/local/tomcat/webapps/openam/configurator --configDir $OPENAM_CONFIG_DIR
    echo "OpenAM configuration completed."
else
    echo "OpenAM is already configured."
fi

# Add additional configuration, realms, or settings if needed
# For example, to create a new realm:
# curl -X POST -H "Content-Type: application/json" -H "X-OpenAM-Username: amAdmin" -H "X-OpenAM-Password: $OPENAM_ADMIN_PASSWORD" -H "Accept-API-Version: resource=2.0, protocol=1.0" -d '{"realm": "/myrealm", "active": "true"}' "$OPENAM_URL/json/global-config/realms"

# Start the Tomcat server
catalina
