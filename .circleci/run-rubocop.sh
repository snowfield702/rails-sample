#!/bin/bash
set -v

export RUBYOPT=-EUTF-8

bundle exec rubocop \
  -r $(bundle show rubocop-junit-formatter)/lib/rubocop/formatter/junit_formatter.rb \
  -c .rubocop.yml \
  --format RuboCop::Formatter::JUnitFormatter \
  --out $CIRCLE_TEST_REPORTS/rubocop/rubocop.xml
