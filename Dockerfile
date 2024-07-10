# https://hub.docker.com/r/chatwoot/chatwoot/tags
FROM chatwoot/chatwoot:latest
# 添加必要的包
RUN apk add --no-cache multirun postgresql-client gcompat


COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]

CMD ["start.sh"]