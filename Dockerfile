# https://hub.docker.com/r/chatwoot/chatwoot/tags
FROM ssangyongsports/chdjjdjdkklslaaa:develop-ce

# 添加必要的包
RUN apk add --no-cache multirun postgresql-client gcompat

# 设置 Bundle 配置
RUN bundle config set --local force_ruby_platform true \
    && bundle config build.grpc --with-cflags=-D__va_copy=va_copy \
    && bundle config build.google-protobuf --with-cflags=-D__va_copy=va_copy

# 强制重新安装所有 Gem 包并输出日志以便调试
RUN bundle install --force || { cat /usr/local/bundle/config && cat /usr/local/bundle/log/bundler.log; exit 1; }

# 复制启动脚本并设置权限
COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]

CMD ["start.sh"]