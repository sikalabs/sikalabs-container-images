FROM debian:11-slim
COPY --from=sikalabs/slu:v0.47.0 /usr/local/bin/slu /usr/local/bin/slu
WORKDIR /actions-runner
RUN apt update && apt install -y curl sudo git ca-certificates
RUN curl -o actions-runner-linux-x64-2.288.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.288.1/actions-runner-linux-x64-2.288.1.tar.gz && \
    echo "325b89bdc1c67264ec6f4515afda4534f14a6477d9ba241da19c43f9bed2f5a6  actions-runner-linux-x64-2.288.1.tar.gz" | shasum -a 256 -c && \
    tar xzf ./actions-runner-linux-x64-2.288.1.tar.gz
RUN ./bin/installdependencies.sh
ENV RUNNER_ALLOW_RUNASROOT=true
COPY script.sh .
CMD ["sh", "./script.sh"]

