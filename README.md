# apache2 docker image based on Alpine Linux

This is a docker image providing apache2. It is based on the [official alpine image](https://hub.docker.com/_/alpine/), making it very small.

By default this image does not provide SSL, as there are many different requirements related to SSL. My advice is to run an instance of nginx that acts as a reverse proxy providing SSL in front of images running your websites.

## Installation

Automated builds are available on [Docker Hub](https://hub.docker.com/r/patagonicus/apache2/). It is recommended to use these images.

## Usage (standalone)

Simply run

    docker run -d --name nginx -p 80:80 -v /path/to/my/site:/var/www/default patagonicus/apache2

## Usage (Dockerfile)

A Dockerfile using this image might look something like this:

    FROM patagonicus/apache2
    
    ADD httpd.conf /etc/apache2/httpd.conf
    ADD site/ /var/www/default/

## Note on running attached

If you run this image without `-d` and with `-it` it'll mean that apache2 will have a terminal. If this terminal is resized, `SIGWINCH` is sent to apache2, which will make it exit.
