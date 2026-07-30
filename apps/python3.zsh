export WORKON_HOME="${WORKON_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/venvs}"
# pylint 2.10+ already caches under XDG. Only the config lookup is hardcoded,
# and setting this skips the home directory entirely.
export PYLINTRC="${PYLINTRC:-${XDG_CONFIG_HOME:-$HOME/.config}/pylint/pylintrc}"
export IPYTHONDIR="${IPYTHONDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/ipython}"
export PYTHON_HISTORY="${PYTHON_HISTORY:-${XDG_STATE_HOME:-$HOME/.local/state}/python_history}"
# Python 3.13+ skips history entirely if the parent dir is missing
[[ -d ${PYTHON_HISTORY:h} ]] || mkdir -p ${PYTHON_HISTORY:h}
