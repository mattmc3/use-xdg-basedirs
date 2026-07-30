# old: ~/.gnupg
export GNUPGHOME=${GNUPGHOME:-$XDG_DATA_HOME/gnupg}
# gpg refuses a home directory that other users can read
mkdir -p -m 700 $GNUPGHOME
