FROM ubuntu:latest

# Update package lists and install openssh-server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean

# Create a new user named "remote_user" and set password
RUN useradd -m remote_user && \
    echo "remote_user:123456" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh


# Copy public key to authorized_keys file
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

# Change ownership and permissions of .ssh directory and authorized_keys file
RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

# Create the privilege separation directory for sshd
RUN mkdir -p /run/sshd

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]

