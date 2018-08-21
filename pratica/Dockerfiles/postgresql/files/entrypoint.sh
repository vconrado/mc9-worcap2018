#!/bin/bash

if [ ! -f "$PGDATA/PG_VERSION" ]; then
    chown -R postgres:postgres $PGDATA
    sudo -u postgres /usr/lib/postgresql/9.5/bin/initdb -D $PGDATA
fi

/etc/init.d/postgresql start

trap "/etc/init.d/postgresql stop" EXIT HUP INT QUIT TERM

bash

