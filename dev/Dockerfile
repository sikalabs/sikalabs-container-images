FROM sikalabs/ci
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  vim \
  tree \
  telnet \
  iputils-ping \
  traceroute \
  htop \
  procps
COPY --from=cloudflare/cloudflared:2022.1.2 /usr/local/bin/ /usr/local/bin/
