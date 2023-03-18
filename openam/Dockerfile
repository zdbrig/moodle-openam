# Use the official ForgeRock OpenAM image as a base
FROM forgerock/openam:7.1.0

# Set environment variables
ENV CATALINA_OPTS="-Xmx2g"

# Copy the custom OpenAM configuration directory
COPY config/ /opt/openam/config/

# Copy the initialization script
COPY init_openam.sh /init_openam.sh

# Set necessary permissions
RUN chmod +x /init_openam.sh

# Execute the initialization script
CMD ["/init_openam.sh"]
