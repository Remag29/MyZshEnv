FROM ubuntu:24.04

RUN apt update && apt install -y sudo

# Create a non-root user
RUN useradd -m testuser -s /bin/bash && \
usermod -aG sudo testuser && \
echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
echo 'testuser:testuser' | chpasswd

# Define working directory
WORKDIR /home/testuser/MyZshEnv

# Copy the script and configuration files
COPY ../../script.sh .
COPY ../../starship.toml .
COPY ../../.aliases .

# Set executable permissions for the script
RUN chmod +x script.sh

# Switch to the non-root user
USER testuser

# Execute the script
ENTRYPOINT [ "/bin/bash" ]