FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y git

# Define build arguments
ARG GITHUB_TOKEN
ARG GITHUB_USER
ARG GITHUB_REPO
ARG GIT_USER_NAME
ARG GIT_USER_EMAIL
ARG SOURCE_PATH
ARG TARGET_PATH

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

# Set up Git configuration
RUN git config --global user.name "${GIT_USER_NAME}" && \
    git config --global user.email "${GIT_USER_EMAIL}"

# Clone the target repository using the token
RUN git clone https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git ${TARGET_PATH}

# Copy build output to the target repository directory
COPY ${SOURCE_PATH}/* ${TARGET_PATH}/

# Commit and push changes
WORKDIR ${TARGET_PATH}
RUN git add . && \
    git commit -m "Automated commit from Docker build" && \
    git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git
