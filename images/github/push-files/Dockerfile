FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y git

# Define build arguments
ARG GITHUB_TOKEN
ARG GITHUB_USER
ARG GITHUB_REPO
ARG GIT_USER_NAME
ARG GIT_USER_EMAIL

# Set environment variables from build arguments
ENV GITHUB_TOKEN=${GITHUB_TOKEN}
ENV GITHUB_USER=${GITHUB_USER}
ENV GITHUB_REPO=${GITHUB_REPO}
ENV GIT_USER_NAME=${GIT_USER_NAME}
ENV GIT_USER_EMAIL=${GIT_USER_EMAIL}

# Set up Git configuration
RUN git config --global user.name "${GIT_USER_NAME}" && \
    git config --global user.email "${GIT_USER_EMAIL}"

# Clone the target repository using the token
RUN git clone https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git /path/to/target-repo

# Copy build output to the target repository directory
COPY /path/to/build/output/* /path/to/target-repo/

# Commit and push changes
WORKDIR /path/to/target-repo
RUN git add . && \
    git commit -m "Automated commit from Docker build" && \
    git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git