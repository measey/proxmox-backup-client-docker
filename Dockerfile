FROM debian:bookworm

# Installation if AMD64 architecture
RUN if [ "$(dpkg --print-architecture)" = "amd64" ]; then \
        apt-get update \
        && apt-get install -y wget ca-certificates openssh-client && \
        && echo "deb http://download.proxmox.com/debian/pbs-client bookworm main" > /etc/apt/sources.list.d/pbs-client.list \
        && wget -q https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookwork.gpg \
        && apt-get update \
        && apt-get install -y --no-install-recommends proxmox-backup-client \
        && apt-get clean &&  rm -rf /var/lib/apt/lists/*; \
    fi

ENTRYPOINT ["proxmox-backup-client"]
