# Use the official Ubuntu image as a base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Run a command to print "Hello, World!" when the container starts
CMD ["echo", "Hello, World!"]
