#!/bin/bash
set -v

export RUBYOPT=-EUTF-8

bundle exec rake db:create db:migrate db:test:prepare

bundle exec rspec \
  --format progress \
  --format RspecJunitFormatter \
  --out $CIRCLE_TEST_REPORTS/rspec.xml
