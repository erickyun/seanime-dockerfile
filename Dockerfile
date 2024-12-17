# Base image
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

# Uncomment the following lines for Intel GPU support (optional)
# RUN apt-get update && apt-get install -y intel-media-va-driver
# VOLUME ["/usr/lib/x86_64-linux-gnu/dri/"]
# DEVICE ["/dev/dri/card0", "/dev/dri/renderD128"]

# Run the default entrypoint
#CMD ["/bin/bash"]
chmod +x /run sh
CMD ["/run.sh"]
