FROM ubuntu:24.04

# Ensure we're root for package installations
USER root

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    && apt-get clean

# Now create a non-root user
RUN useradd -m -d /home/jenkins -s /bin/bash jenkins

# Switch to the non-root user AFTER all apt operations
USER jenkins
WORKDIR /home/jenkins

# Infinite loop to keep container alive
CMD ["/bin/bash", "-c", "while true; do sleep 30; done"]
