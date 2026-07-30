#
# XDG base dirs - don't pollute home
#

0=${(%):-%N}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $XDG_DATA_HOME $XDG_STATE_HOME

if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR="/tmp/xdg-runtime-$UID"
fi
if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
  mkdir -m 700 -p "$XDG_RUNTIME_DIR"
elif [[ ! -O "$XDG_RUNTIME_DIR" || -L "$XDG_RUNTIME_DIR" ]]; then
  print -u2 "use-xdg-basedirs: $XDG_RUNTIME_DIR is a symlink or not owned by uid $UID"
fi

# readline
export INPUTRC="${INPUTRC:-$XDG_CONFIG_HOME/readline/inputrc}"

# App-specific XDG settings. Each file is opt-out via
#   zstyle ':use-xdg-basedirs:<app>' enabled no
# and opt-in for apps that are not installed, or have no command to find, via
#   zstyle ':use-xdg-basedirs:<app>' enabled yes
# With no style set, a file loads only when its command exists.
for _xdg_app in "${0:a:h}/apps"/*.zsh(N); do
  _xdg_name=${_xdg_app:t:r}
  if zstyle -t ":use-xdg-basedirs:$_xdg_name" enabled; then
    source "$_xdg_app"
  elif zstyle -T ":use-xdg-basedirs:$_xdg_name" enabled; then
    (( $+commands[$_xdg_name] )) && source "$_xdg_app"
  fi
done
unset _xdg_app _xdg_name
