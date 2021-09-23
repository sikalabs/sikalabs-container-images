ARG VERSION=v0.12.0
FROM sikalabs/tergum:$VERSION
COPY \
  --from=mysql \
  /usr/lib/x86_64-linux-gnu/* \
  /usr/lib/x86_64-linux-gnu/
COPY \
  --from=mysql \
  /usr/bin/mysqldump \
  /usr/local/bin
