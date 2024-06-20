# Use the official Ubuntu image as a base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Define build arguments with default values
ARG GITHUB_TOKEN="test"
ARG GITHUB_USER="test"
ARG GITHUB_REPO="test"
ARG GIT_USER_NAME="test"
ARG GIT_USER_EMAIL="test"
ARG SOURCE_PATH="test"
ARG TARGET_PATH="test"

# Set environment variables from build arguments
ENV GITHUB_TOKEN=${GITHUB_TOKEN}
ENV GITHUB_USER=${GITHUB_USER}
ENV GITHUB_REPO=${GITHUB_REPO}
ENV GIT_USER_NAME=${GIT_USER_NAME}
ENV GIT_USER_EMAIL=${GIT_USER_EMAIL}
ENV SOURCE_PATH=${SOURCE_PATH}
ENV TARGET_PATH=${TARGET_PATH}

# Debugging: Print environment variables to verify they are set correctly
RUN echo "GITHUB_TOKEN=${GITHUB_TOKEN}" && \
    echo "GITHUB_USER=${GITHUB_USER}" && \
    echo "GITHUB_REPO=${GITHUB_REPO}" && \
    echo "GIT_USER_NAME=${GIT_USER_NAME}" && \
    echo "GIT_USER_EMAIL=${GIT_USER_EMAIL}" && \
    echo "SOURCE_PATH=${SOURCE_PATH}" && \
    echo "TARGET_PATH=${TARGET_PATH}"

# Run a command to print "Hello, World!" when the container starts
CMD ["echo", "Hello, World!"]
