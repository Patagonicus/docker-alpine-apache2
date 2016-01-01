FROM alpine:3.3
MAINTAINER Philipp Adolf <derphilippadolf@googlemail.com>

RUN apk add --no-cache \
    apache2 && \
  mkdir -p /run/apache2

RUN rm -rf /var/www/localhost && \
  mkdir /var/www/default

ADD root/ /

EXPOSE 80
CMD ["/entrypoint.sh"]
