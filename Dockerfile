FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y proxmox-backup-client ca-certificates openssh-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["proxmox-backup-client"]
