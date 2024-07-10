#!/bin/sh

set -e

bundle exec rails db:chatwoot_prepare

bundle exec rails db:migrate


bundle exec rails s -b 0.0.0.0 -p 3000
