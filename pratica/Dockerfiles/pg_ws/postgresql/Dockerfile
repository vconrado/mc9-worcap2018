FROM ubuntu:16.04
LABEL maintainer="Vitor Gomes <vconrado@gmail.com>"

EXPOSE 5432

ENV PG_PASSWORD=dbpass
ENV PGDATA=/var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

RUN apt-get update \
    && apt-get install -y sudo postgresql-9.5 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p $PGDATA \
    && chown -R postgres:postgres $PGDATA \
    && chmod o-rxw $PGDATA \
    && echo "export PGDATA=$PGDATA" >> /etc/bash.bashrc \
    && echo "data_directory = '$PGDATA'" >> /etc/postgresql/9.5/main/postgresql.conf \
    && mkdir -p /data


COPY files/entrypoint.sh /entrypoint.sh

COPY files/create_table.sql /data
COPY files/insert_data.sql /data

RUN chown -R postgres:postgres /data

ENTRYPOINT  ["/entrypoint.sh"]
