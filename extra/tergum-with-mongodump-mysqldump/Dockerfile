ARG TERGUM_VERSION=v0.16.0
FROM sikalabs/tergum:$TERGUM_VERSION
RUN apt-get update
RUN apt-get install -y sudo wget gnupg2
RUN apt-get install -y mariadb-client-10.3
RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN sudo apt-get update
RUN sudo apt-get install -y mongodb-org-tools
