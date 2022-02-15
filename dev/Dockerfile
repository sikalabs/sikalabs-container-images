FROM sikalabs/ci
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  bash-completion \
  vim \
  tree \
  telnet \
  iputils-ping \
  traceroute \
  htop \
  procps
COPY bashrc /root/.bashrc
COPY --from=cloudflare/cloudflared:2022.1.2 /usr/local/bin/ /usr/local/bin/
COPY --from=ondrejsika/training-cli:v0.1.0-dev-3 /usr/local/bin/training-cli /usr/local/bin/
