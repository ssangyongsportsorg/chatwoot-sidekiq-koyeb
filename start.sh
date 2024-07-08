#!/bin/sh

set -e

bundle exec rails db:chatwoot_prepare

bundle exec rails db:migrate

multirun \
    "bundle exec sidekiq -C config/sidekiq.yml" \
    "bundle exec rails s -b 0.0.0.0 -p $PORT"

false
