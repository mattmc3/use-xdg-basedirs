# use-xdg-basedirs

> Don't pollute home

This repo is a Zsh plugin to help set up XDG Base Directories variables for apps
that don't respect them by default.

If you are unfamiliar, you can read about XDG Base Directories at these links:
- [Specification][xdg-basedir-spec]
- [App Support][xdg-basedir-support].

The plugin sets the XDG base directory variables themselves, then sets the
variables that individual apps need in order to honor them. Apps are opt-in.
Nothing is moved for you, and nothing is turned on behind your back.

## Configuration

Turn an app on with `zstyle`, before the plugin loads. The app name is the
filename in `apps/`, minus `.zsh`, and contexts are patterns:

```zsh
zstyle ':use-xdg-basedirs:cargo' enabled yes
zstyle ':use-xdg-basedirs:(less|npm|python3)' enabled yes
```

## xdgbasedir

Run `xdgbasedir` to see where things stand. It reports what is on, what is
safe to turn on, and what still has files in your home directory:

```
on (3)
  cargo       CARGO_HOME
  less        LESSHISTFILE LESSKEY
  python3     WORKON_HOME PYLINTRC PYTHON_HISTORY IPYTHONDIR

on, hiding files you still have (1)
  claude      ~/.claude -> ~/.config/claude

move these first, then turn on (2)
  codex       ~/.codex -> ~/.config/codex
  rbenv       ~/.rbenv -> ~/.local/share/rbenv

safe to turn on, command found (4)
  go gpg jupyter npm
  zstyle ':use-xdg-basedirs:(go|gpg|jupyter)' enabled yes
```

Anything under a "move" heading has files where the app used to keep them, so
turning it on points the app at an empty location and hides what is there.
Move the directory yourself and it drops into `safe to turn on`:

```zsh
mv ~/.claude ~/.config/claude
```

The report reads the app files directly and applies nothing, so it is always
describing what your next shell would do.

## Adding an app

Files in `apps/` are plain exports and nothing else. Keep the logic out of
them:

```zsh
# old: ~/.cargo
export CARGO_HOME=$XDG_DATA_HOME/cargo
```

The `# old:` comment records where the app kept that variable's files before,
and applies to the export on the next line. It is the only thing that lets
`xdgbasedir` tell a safe app from one that would hide your files, so a
variable with a previous home needs one. Use a separate comment per variable
rather than one for the file, since an existing `~/.npmrc` matters even after
`~/.npm` has been moved. History counts too. Someone greps years of
`~/.psql_history`, and pointing at an empty file reads as data loss whether or
not the bytes survived.

Only set variables that are inert when the app is absent. Ones that change
behavior for other tools do not belong here, no matter how much home clutter
they save. `GEM_HOME` is the cautionary example: it moves gems under XDG, but
it also overrides the install prefix that rbenv, rvm, and chruby manage.

`XDG_CONFIG_HOME`, `XDG_CACHE_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME`, and
`XDG_RUNTIME_DIR` are all set before any app file loads, so write
`$XDG_CACHE_HOME/foo` rather than repeating a `:-$HOME/.cache` fallback.

[xdg-basedir-support]: https://wiki.archlinux.org/index.php/XDG_Base_Directory
[xdg-basedir-spec]: https://specifications.freedesktop.org/basedir/latest/
