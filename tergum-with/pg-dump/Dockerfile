ARG VERSION=v0.12.0
FROM sikalabs/tergum:$VERSION
COPY \
  --from=postgres \
  /usr/lib/x86_64-linux-gnu/* \
  /usr/lib/x86_64-linux-gnu/
COPY \
  --from=postgres \
  /usr/bin/pg_dump \
  /usr/local/bin
