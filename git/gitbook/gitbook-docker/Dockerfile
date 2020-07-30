FROM node:10.22.0-alpine3.11

ENV GITBOOK_VERSION 3.2.3

RUN npm install gitbook-cli -g \
    && gitbook fetch ${GITBOOK_VERSION}

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4000 35729

CMD [ "gitbook" ]