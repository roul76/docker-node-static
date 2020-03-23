FROM alpine:3.10
LABEL maintainer="https://github.com/roul76"
# https://www.npmjs.com/package/node-static

ENV NODE_STATIC_PORT=3001 \
    NODE_STATIC_ADDRESS=0.0.0.0 \
    NODE_STATIC_DIR=/home/static

RUN apk add --no-cache --purge --upgrade npm
RUN npm install --production -g node-static
RUN addgroup -g 1000 static && \
    addgroup -g 10001 webconsole && \
    adduser -u 1000 -G static -D -h "/home/static" -s "/bin/false" static && \
    addgroup static webconsole

COPY --chown=static:static ./entrypoint.sh /home/static/
USER static
EXPOSE ${NODE_STATIC_PORT}
ENTRYPOINT [ "/bin/sh", "/home/static/entrypoint.sh" ]
