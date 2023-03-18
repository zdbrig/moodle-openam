# Use the official Moodle image as a base
FROM moodlehq/moodle-php-apache:3.11

# Copy the custom Moodle configuration file
COPY config.php /var/www/html/

# Copy the initialization script
COPY init_moodle.sh /init_moodle.sh

# Set necessary permissions
RUN chmod +x /init_moodle.sh

# Install any additional required PHP extensions (if needed)
# RUN docker-php-ext-install <extension_name>

# Execute the initialization script
CMD ["/init_moodle.sh"]
