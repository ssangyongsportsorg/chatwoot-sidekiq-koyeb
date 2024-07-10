# https://hub.docker.com/r/chatwoot/chatwoot/tags
FROM ssangyongsports/chdjjdjdkklslaaa:develop-ce

# 添加必要的包
RUN apk add --no-cache multirun postgresql-client gcompat

RUN bundle config set --local force_ruby_platform true
RUN bundle config build.grpc --with-cflags=-D__va_copy=va_copy
RUN bundle config build.google-protobuf --with-cflags=-D__va_copy=va_copy
# 复制启动脚本并设置权限
COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]

CMD ["start.sh"]