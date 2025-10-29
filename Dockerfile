FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color
ENV LANG=C.UTF-8

# Update and install essential packages
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    vim \
    nano \
    git \
    tree \
    htop \
    net-tools \
    iputils-ping \
    dnsutils \
    openssl \
    file \
    man-db \
    manpages \
    fish \
    ssh \
    cron \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Create level users and set up directory structure
RUN for i in {1..14}; do \
        useradd -m -s /bin/bash level$i && \
        echo "level$i:level$i" | chpasswd; \
    done

# Create practice directory structure
RUN mkdir -p /opt/levels /opt/config /opt/utils

# Set up sudo permissions
RUN echo "level9 ALL=(root) /bin/cat /home/level9/password.txt" >> /etc/sudoers.d/level9
RUN echo "level10 ALL=(ALL) /usr/bin/passwd level11" >> /etc/sudoers.d/level10
RUN chmod 440 /etc/sudoers.d/level9 /etc/sudoers.d/level10

# Set up cron jobs
RUN echo '*/5 * * * * level12 echo "su level13 #level13_password_is_hidden_in_cron" > /tmp/level12_check.txt' >> /etc/crontab

# Configure bash for all users
RUN echo "alias ll='ls -la'" >> /etc/bash.bashrc && \
    echo "alias la='ls -A'" >> /etc/bash.bashrc && \
    echo "alias l='ls -CF'" >> /etc/bash.bashrc && \
    echo "PS1='\\[\\033[1;32m\\]\\u@\\h\\[\\033[0m\\]:\\[\\033[1;34m\\]\\w\\[\\033[0m\\]\\$ '" >> /etc/bash.bashrc

# Set proper permissions
RUN chmod 755 /home && \
    chown -R level1:level1 /home/level1

# Create level14 user with specific UID
RUN userdel level14 && \
    useradd -m -s /bin/bash -u 1337 level14 && \
    echo "level14:level14" | chpasswd

# Add level14 to all level groups
RUN for i in {1..13}; do \
        usermod -a -G level$i level14; \
    done

# Install additional tools for specific levels
RUN apt-get update && apt-get install -y \
    gzip \
    bzip2 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Create victory flag
RUN echo "FLAG(Terminator_Commander)" > /home/level14/FLAG.txt && \
    chown level14:level14 /home/level14/FLAG.txt && \
    chmod 600 /home/level14/FLAG.txt

# Set up entry point
WORKDIR /home/level1

# Copy setup scripts (will be mounted via volumes in development)
COPY scripts/ /opt/scripts/
RUN chmod +x /opt/scripts/*.sh

# Expose ports if needed for web access
EXPOSE 22 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD ps aux | grep bash | grep -v grep || exit 1

# Default command (will be overridden by docker-compose)
CMD ["/bin/bash", "-c", "service cron start && /bin/bash"]
