FROM ghcr.io/sikalabs/dev
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN mkdir -p /root/workspace
COPY settings.json /root/.local/share/code-server/User/settings.json
RUN echo "alias use_master_slu='slu install-bin master_slu && cp /usr/local/bin/master_slu /usr/local/bin/slu'" >> /root/.zshrc
RUN echo "alias use_master_slr='slu install-bin master_slr && cp /usr/local/bin/master_slr /usr/local/bin/slr'" >> /root/.zshrc
CMD ["code-server", "--bind-addr", "0.0.0.0:48080", "--auth", "none", "/root/workspace"]
EXPOSE 48080
