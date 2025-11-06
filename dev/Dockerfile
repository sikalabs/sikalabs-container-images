FROM sikalabs/ci
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  software-properties-common \
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
  apache2-utils \
  pv \
  redis-tools \
  openssh-server
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git /.oh-my-zsh
COPY zshrc /root/.zshrc
COPY bashrc /root/.bashrc

COPY bin/k /usr/local/bin/
RUN chmod +x /usr/local/bin/k

COPY --from=cloudflare/cloudflared:2022.1.2 /usr/local/bin/ /usr/local/bin/
COPY --from=ondrejsika/training-cli:v0.4.2 /usr/local/bin/training-cli /usr/local/bin/
COPY --from=ghcr.io/sikalabs/pause /pause /usr/local/bin/

CMD [ "zsh" ]
