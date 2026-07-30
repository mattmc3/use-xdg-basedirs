# old: ~/.redisclirc
export REDISCLI_RCFILE=${REDISCLI_RCFILE:-$XDG_CONFIG_HOME/redis/redisclirc}
# old: ~/.rediscli_history
export REDISCLI_HISTFILE=${REDISCLI_HISTFILE:-$XDG_DATA_HOME/redis/rediscli_history}
mkdir -p ${REDISCLI_HISTFILE:h}
