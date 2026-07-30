# rg warns on stderr every run if this names a file that is not there, and it
# never creates one, so only point at the config once it exists.
_xdg_rgconf="${XDG_CONFIG_HOME:-$HOME/.config}/ripgrep/config"
[[ -f $_xdg_rgconf ]] && export RIPGREP_CONFIG_PATH="${RIPGREP_CONFIG_PATH:-$_xdg_rgconf}"
unset _xdg_rgconf
