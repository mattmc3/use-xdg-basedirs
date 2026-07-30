export GNUPGHOME="${GNUPGHOME:-${XDG_DATA_HOME:-$HOME/.local/share}/gnupg}"
# gpg refuses a home directory that other users can read
[[ -d $GNUPGHOME ]] || mkdir -p -m 700 $GNUPGHOME
