# Use the base image
FROM valgul/seanime:latest

# Set environment variables (if needed)
ENV SEANIME_DOWNLOAD_DIR="/downloads" \
    SEANIME_CONFIG_DIR="/root/.config/Seanime"

# Create required directories
RUN mkdir -p $SEANIME_DOWNLOAD_DIR $SEANIME_CONFIG_DIR

# Expose the necessary ports
EXPOSE 43211

# Set default volumes
VOLUME ["/downloads", "/root/.config/Seanime"]

# Create the run.sh script
RUN echo '#!/bin/bash\n\ndocker run -it -p 43211:43211 -p 8080:8080 -p 6881:6881 -p 6881:6881/udp --restart=always --name seanime valgul/seanime' > /run.sh

# Make the script executable
RUN chmod +x /run.sh

# Set the default command to execute the script
#CMD ["/run.sh"]

# Run Docker in privileged mode
CMD ["bash", "-c", "docker run --privileged -it -p 43211:43211 -p 8080:8080 -p 6881:6881 -p 6881:6881/udp --restart=always --name seanime valgul/seanime"]

