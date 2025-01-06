# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Install Python, pip, and Java
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    openjdk-17-jdk \
    && apt-get clean

# Create a non-root user
RUN useradd -m flaskuser

# Switch to the non-root user
USER flaskuser

# Set the working directory
WORKDIR /home/flaskuser/app

# Copy application files
COPY --chown=flaskuser:flaskuser app.py .

# Create a virtual environment and install Flask
RUN python3 -m venv venv && \
    ./venv/bin/pip install flask

# Expose the port Flask will run on
EXPOSE 5000

# Run the Flask application
CMD ["/bin/bash", "-c", "while true; do sleep 30; done"]
