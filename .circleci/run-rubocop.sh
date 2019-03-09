#!/bin/bash
set -v

export RUBYOPT=-EUTF-8

if [ "${CIRCLE_BRANCH}" != "master" ] && [ "${CIRCLE_BRANCH}" != "develop" ]; then
  git diff -z --name-only origin/develop \
   | xargs -0 bundle exec rubocop-select \
   | xargs bundle exec rubocop \
       --require rubocop/formatter/checkstyle_formatter \
       --format RuboCop::Formatter::CheckstyleFormatter \
   | bundle exec checkstyle_filter-git diff origin/develop \
   | bundle exec saddler report \
      --require saddler/reporter/github \
      --reporter Saddler::Reporter::Github::PullRequestReviewComment
fi

bundle exec rubocop \
  -r $(bundle show rubocop-junit-formatter)/lib/rubocop/formatter/junit_formatter.rb \
  -c .rubocop.yml \
  --format RuboCop::Formatter::JUnitFormatter \
  --out $CIRCLE_TEST_REPORTS/rubocop/rubocop.xml
