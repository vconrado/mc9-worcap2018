#!/bin/bash

/etc/init.d/postgresql start

trap "/etc/init.d/postgresql stop" EXIT HUP INT QUIT TERM

if [ ! -f /root/startup.lock ]; then
    echo "Initial configuration:"

    echo "Updating postgresql password ..."
    sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password '$PG_PASSWORD';"

    echo "Creating database teste ..."
    sudo -u postgres createdb teste

    echo "Creating table usuario ..."
    sudo -u postgres psql -U postgres -d teste -f /data/create_table.sql

    echo "Inserting data ..."
    sudo -u postgres psql -U postgres -d teste -f /data/insert_data.sql

    echo "Done !!!"
    touch /root/startup.lock    
fi

bash

