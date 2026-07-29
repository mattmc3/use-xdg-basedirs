# use-xdg-basedirs

> Don't pollute home

This repo is a Zsh plugin to help set up XDG Base Directories variables for apps
that don't respect them by default.

If you are unfamiliar, you can read about XDG Base Directories at these links:
- [Specification][xdg-basedir-spec]
- [App Support][xdg-basedir-support].

This plugin simply looks for command line utilities that don't respect XDG base dirs on
your system and if it finds them if adds definitions for XDG basedir support.

[xdg-basedir-support]: https://wiki.archlinux.org/index.php/XDG_Base_Directory
[xdg-basedir-spec]: https://specifications.freedesktop.org/basedir/latest/
