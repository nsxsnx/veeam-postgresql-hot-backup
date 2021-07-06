#!/bin/sh
PATH=$PATH:/bin:/usr/bin:/usr/local/bin:~/bin
export PGPASSWORD='PASSWORD'
QUERY="DO \$do\$ BEGIN IF NOT (SELECT pg_is_in_backup()) THEN PERFORM pg_start_backup('veeam_backup', true); END IF; END \$do\$"
psql -h 'localhost' -U 'postgres' -c "$QUERY"
exit $?
