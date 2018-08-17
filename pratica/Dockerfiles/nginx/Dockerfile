FROM ubuntu:16.04
LABEL maintainer="Vitor Gomes <vconrado@gmail.com>"

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY html/index.nginx-debian.html /var/www/html/

CMD ["bash"]
