FROM ruby:2.6.1

ENV TZ=Asia/Tokyo
ENV LANG=C.UTF-8

# package install
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
            mysql-client \
            redis-tools \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /api

COPY . .
