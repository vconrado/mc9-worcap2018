FROM ubuntu:16.04
LABEL maintainer="Vitor Gomes <vconrado@gmail.com>"

EXPOSE 5432

ENV PG_PASSWORD=dbpass

VOLUME /var/lib/postgresql/9.5/main

RUN apt-get update \
    && apt-get install -y sudo postgresql-9.5 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data

COPY files/create_table.sql /data
COPY files/insert_data.sql /data

RUN chmod o+r /data

COPY files/pg_hba.conf /etc/postgresql/9.5/main/
COPY files/postgresql.conf /etc/postgresql/9.5/main/

RUN chown -R postgres:postgres /etc/postgresql/9.5/main/ \
    && chmod g+r /etc/postgresql/9.5/main/*

COPY files/entrypoint.sh /entrypoint.sh

ENTRYPOINT  ["/entrypoint.sh"]
