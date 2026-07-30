# old: ~/.psqlrc
export PSQLRC=$XDG_CONFIG_HOME/pg/psqlrc
# old: ~/.pgpass
export PGPASSFILE=$XDG_CONFIG_HOME/pg/pgpass
# old: ~/.pg_service.conf
export PGSERVICEFILE=$XDG_CONFIG_HOME/pg/pg_service.conf
# old: ~/.psql_history
export PSQL_HISTORY=$XDG_STATE_HOME/pg/psql_history
mkdir -p $XDG_STATE_HOME/pg
