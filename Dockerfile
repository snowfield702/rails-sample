FROM ruby:2.6.1

ENV TZ=Asia/Tokyo
ENV LANG=C.UTF-8

WORKDIR /api

COPY . .
