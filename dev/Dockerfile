FROM sikalabs/ci
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  zsh \
  bash-completion \
  vim \
  mc \
  tree \
  telnet \
  iputils-ping \
  traceroute \
  htop \
  procps \
  apache2-utils
COPY bashrc /root/.bashrc

COPY bin/k /usr/local/bin/
RUN chmod +x /usr/local/bin/k

COPY --from=cloudflare/cloudflared:2022.1.2 /usr/local/bin/ /usr/local/bin/
COPY --from=ondrejsika/training-cli:v0.4.1 /usr/local/bin/training-cli /usr/local/bin/
