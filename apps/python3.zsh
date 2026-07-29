export WORKON_HOME="${WORKON_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/venvs}"
export PYLINTHOME="${PYLINTHOME:-${XDG_CACHE_HOME:-$HOME/.cache}/pylint}"
export IPYTHONDIR="${IPYTHONDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/ipython}"
export PYTHON_HISTORY="${PYTHON_HISTORY:-${XDG_STATE_HOME:-$HOME/.local/state}/python_history}"
# Python 3.13+ skips history entirely if the parent dir is missing
[[ -d ${PYTHON_HISTORY:h} ]] || mkdir -p ${PYTHON_HISTORY:h}
