FROM debian:12-slim
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends openssh-server tzdata && \
  rm -rf /var/lib/apt/lists

RUN mkdir /var/run/sshd
RUN sed -i 's/^#\(PermitRootLogin\) .*/\1 yes/' /etc/ssh/sshd_config
RUN sed -i 's/^\(UsePAM yes\)/# \1/' /etc/ssh/sshd_config

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
ENV TZ UTC
ENV ROOT_PASSWORD root
EXPOSE 22
