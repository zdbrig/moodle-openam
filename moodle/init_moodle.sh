#!/bin/bash

# Set variables
MOODLE_DB_HOST=${MOODLE_DB_HOST:-"db"}
MOODLE_DB_NAME=${MOODLE_DB_NAME:-"moodle"}
MOODLE_DB_USER=${MOODLE_DB_USER:-"moodle"}
MOODLE_DB_PASSWORD=${MOODLE_DB_PASSWORD:-"moodle"}
MOODLE_URL=${MOODLE_URL:-"http://localhost"}

# Wait for the database service to be ready
until mysql -h "$MOODLE_DB_HOST" -u "$MOODLE_DB_USER" -p"$MOODLE_DB_PASSWORD" -e "show databases;" &> /dev/null; do
  echo "Waiting for the database service to be ready..."
  sleep 3
done

# Install Moodle if not installed
if ! $(php /var/www/html/admin/cli/isinstalled.php); then
    echo "Installing Moodle..."
    php /var/www/html/admin/cli/install_database.php --adminpass=admin --agree-license --fullname="Moodle Site" --shortname="Moodle" --summary="Moodle test site" --adminemail="admin@example.com"
    echo "Moodle installation completed."
else
    echo "Moodle is already installed."
fi

# Start the Apache server
apache2-foreground
