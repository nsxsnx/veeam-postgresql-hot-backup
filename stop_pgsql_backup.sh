#!/bin/sh
PATH=$PATH:/bin:/usr/bin:/usr/local/bin:~/bin
export PGPASSWORD='PASSWORD'
QUERY="DO \$do\$ BEGIN IF (SELECT pg_is_in_backup()) THEN PERFORM pg_stop_backup(); END IF; END \$do\$"
/usr/bin/psql -h 'localhost' -U 'postgres' -c "$QUERY"
exit $?
