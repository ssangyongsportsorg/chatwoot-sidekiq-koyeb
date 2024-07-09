# https://hub.docker.com/r/chatwoot/chatwoot/tags
FROM ssangyongsports/chdjjdjdkklslaaa:develop-ce

RUN apk add --no-cache multirun postgresql-client
RUN bundle config set --local force_ruby_platform true
RUN bundle config build.grpc --with-cflags=-D__va_copy=va_copy
RUN bundle config build.google-protobuf --with-cflags=-D__va_copy=va_copy
COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]

CMD ["start.sh"]
