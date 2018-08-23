#!/bin/bash

if [ ! -f "$PGDATA/PG_VERSION" ]; then
    chown -R postgres:postgres $PGDATA
    sudo -u postgres /usr/lib/postgresql/9.5/bin/initdb -D $PGDATA
    echo "host    all             all             0.0.0.0/0               md5" >> /etc/postgresql/9.5/main/pg_hba.conf
    echo "listen_addresses = '*'" >> /etc/postgresql/9.5/main/postgresql.conf

fi


/etc/init.d/postgresql start

if [ ! -f /root/startup.lock ]; then
    echo "Initial configuration:"
    
    echo "Updating postgresql password ..."
    sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password '$PG_PASSWORD';"

    echo "Creating database worcap ..."
    sudo -u postgres psql -U postgres -c "create database worcap with template = template0 encoding = 'UTF8';"

    echo "Creating table minicurso ..."
    sudo -u postgres psql -U postgres -d worcap -f /data/create_table.sql

    echo "Inserting data ..."
    sudo -u postgres psql -U postgres -d worcap -f /data/insert_data.sql

    echo "Done !!!"
    touch /root/startup.lock    
fi

trap "/etc/init.d/postgresql stop" EXIT HUP INT QUIT TERM

bash
