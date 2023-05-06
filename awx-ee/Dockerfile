FROM quay.io/ansible/awx-ee:latest
USER 0
RUN ansible-galaxy collection install community.docker
RUN ansible-galaxy install geerlingguy.docker
USER 1000
