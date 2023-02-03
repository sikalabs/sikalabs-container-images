FROM debian:11-slim
# Install PowerShell on Debian
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian?view=powershell-7.3#installation-on-debian-11-via-package-repository
RUN \
  apt-get update && \
  apt-get install -y -y --no-install-recommends \
    curl apt-transport-https gnupg ca-certificates && \
  curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
  sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list' && \
  apt-get update && \
  apt install -y --no-install-recommends \
    powershell
CMD ["pwsh"]
