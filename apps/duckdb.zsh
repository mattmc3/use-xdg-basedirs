# old: ~/.duckdb_history
export DUCKDB_HISTORY=${DUCKDB_HISTORY:-$XDG_STATE_HOME/duckdb/history}
mkdir -p ${DUCKDB_HISTORY:h}
