# wget exits with an error if WGETRC names a file that is not there, and it
# never creates one, so only point at the config once it exists.
_xdg_wgetrc="${XDG_CONFIG_HOME:-$HOME/.config}/wgetrc"
[[ -f $_xdg_wgetrc ]] && export WGETRC="${WGETRC:-$_xdg_wgetrc}"
unset _xdg_wgetrc
alias wget="${aliases[wget]:-wget} --hsts-file=${XDG_STATE_HOME:-$HOME/.local/state}/wget-hsts"
