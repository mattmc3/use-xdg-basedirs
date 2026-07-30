# use-xdg-basedirs

> Don't pollute home

This repo is a Zsh plugin to help set up XDG Base Directories variables for apps
that don't respect them by default.

If you are unfamiliar, you can read about XDG Base Directories at these links:
- [Specification][xdg-basedir-spec]
- [App Support][xdg-basedir-support].

This plugin simply looks for command line utilities that don't respect XDG base dirs on
your system and if it finds them if adds definitions for XDG basedir support.

## Configuration

By default an app's variables are only set when its command is found on your
`PATH`, so nothing is exported for software you don't have. Override that per
app with `zstyle`, before the plugin loads:

```zsh
# Set variables for an app that has no command to find, or that you have not
# installed yet, so its first run lands in the right place.
zstyle ':use-xdg-basedirs:codex' enabled yes

# Leave an app alone entirely.
zstyle ':use-xdg-basedirs:tmux' enabled no
```

Contexts are patterns, and the most specific one wins, so whole policies are
two lines:

```zsh
# Everything, installed or not.
zstyle ':use-xdg-basedirs:*' enabled yes

# Nothing except what you name.
zstyle ':use-xdg-basedirs:*' enabled no
zstyle ':use-xdg-basedirs:(aws|cargo|go)' enabled yes
```

The app name is the filename in `apps/`, minus `.zsh`.

## Adding an app

Each file in `apps/` should only set variables that are inert when the app is
absent. Variables that change behavior for other tools do not belong here, no
matter how much home clutter they save. `GEM_HOME` is the cautionary example:
it moves gems under XDG, but it also overrides the install prefix that rbenv,
rvm, and chruby manage.

[xdg-basedir-support]: https://wiki.archlinux.org/index.php/XDG_Base_Directory
[xdg-basedir-spec]: https://specifications.freedesktop.org/basedir/latest/
