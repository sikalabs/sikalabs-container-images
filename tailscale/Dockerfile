FROM debian:12-slim
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
  && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://tailscale.com/install.sh | sh
CMD [ "tailscaled", "--tun=userspace-networking", "--socks5-server=localhost:1055" ]
