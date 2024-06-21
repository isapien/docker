FROM ubuntu:22.04

LABEL maintainer="jordan.burke@i-sapien.com"

# Install required packages
RUN apt-get update && apt-get install -y git

# Copy entrypoint script to the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]