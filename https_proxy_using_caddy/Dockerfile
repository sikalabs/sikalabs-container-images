FROM caddy
RUN apk add nss-tools
COPY entrypoint.sh /entrypoint.sh
VOLUME [ "/data" ]
ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
