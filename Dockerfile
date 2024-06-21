# Use the official Ubuntu image as a base image
FROM ubuntu:22.04

# Set the maintainer label
LABEL maintainer="jordan.burke@i-sapien.com"

# Define build arguments with default values
ARG VERSION="test"

# Set environment variables from build arguments
ENV VERSION=${VERSION}

# Debugging: Print environment variables to verify they are set correctly
RUN echo "VERSION=${VERSION}"

# Run a command to print "Hello, World!" when the container starts
CMD ["echo", "Hello, World!"]
