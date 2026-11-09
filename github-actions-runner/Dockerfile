FROM debian:13-slim
COPY --from=ghcr.io/sikalabs/slu:v0.105.0 /usr/local/bin/slu /usr/local/bin/slu
WORKDIR /actions-runner
RUN apt update && apt install -y curl sudo git ca-certificates
RUN curl -o actions-runner-linux-x64-2.338.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.338.2/actions-runner-linux-x64-2.338.2.tar.gz && \
    echo "baebf204307bac6193480852732f0aba2ae97b6c5597c244f4d5558390147c40  actions-runner-linux-x64-2.338.2.tar.gz" | shasum -a 256 -c && \
    tar xzf ./actions-runner-linux-x64-2.338.2.tar.gz
RUN ./bin/installdependencies.sh
ENV RUNNER_ALLOW_RUNASROOT=true
COPY script.sh .
CMD ["sh", "./script.sh"]

