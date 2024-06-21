#!/bin/sh

# Set up Git configuration
git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"

# Clone the target repository using the token
git clone https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git ${TARGET_PATH}

# Copy build output to the target repository directory
cp -r ${SOURCE_PATH}/* ${TARGET_PATH}/

# Navigate to the target path
cd ${TARGET_PATH}

# Add changes to git
git add .

# Commit the changes
git commit -m "Automated commit from Docker container runtime"

# Push the changes
git push https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git

# Run any other command passed to the container
exec "$@"