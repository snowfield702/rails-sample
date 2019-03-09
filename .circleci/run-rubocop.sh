#!/bin/bash
set -v

export RUBYOPT=-EUTF-8

bundle exec rubocop
