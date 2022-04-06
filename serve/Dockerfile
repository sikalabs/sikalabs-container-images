FROM node:17-slim
RUN yarn global add serve
ENV DIR=/
CMD ["/bin/sh", "-c", "cd $DIR && serve -l 80"]
EXPOSE 80
