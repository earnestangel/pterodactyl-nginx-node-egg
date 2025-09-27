# ── Base image ─────────────────────────────────────────────
FROM debian:bookworm-slim

LABEL author="EarnestAngel" maintainer="fareast.sn@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive \
    NODE_VERSION=22

# ── Install dependencies ──────────────────────────────────
RUN apt-get update && apt-get install -y \
        git \
        apt-transport-https \
        lsb-release \
        ca-certificates \
        wget \
        curl \
        nginx \
        unzip \
    # ── Cloudflared ──
    && ARCH=$(uname -m) \
    && if [ "$ARCH" = "x86_64" ]; then \
        wget -O /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb; \
    elif [ "$ARCH" = "aarch64" ]; then \
        wget -O /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb; \
    else \
        echo "Unsupported architecture: $ARCH" && exit 1; \
    fi \
    && dpkg -i /tmp/cloudflared.deb \
    && rm /tmp/cloudflared.deb \
    # ── Node.js 22 (official NodeSource repo) ──
    && curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest \
    && rm -rf /var/lib/apt/lists/*

# ── Create non-root user ───────────────────────────────────
RUN useradd -m -d /home/container -s /bin/bash container \
    && echo "USER=container" >> /etc/environment \
    && echo "HOME=/home/container" >> /etc/environment

WORKDIR /home/container

STOPSIGNAL SIGINT

# ── Copy entrypoint ────────────────────────────────────────
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
