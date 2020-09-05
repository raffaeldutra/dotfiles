# Dotfiles (Rafael Dutra)

My all dotfiles used on bash Linux, please feel free to change it, if you want.

## How to install

The command below will download the Makefile and then run it.

```
$ curl -OLs https://raw.githubusercontent.com/raffaeldutra/dotfiles/master/Makefile && make -s clone && make dotfiles
```

This will create a `dotfiles` directory where you are downloading it and then it will create all the links needed for all files.

At the end, you'll get a structure ~like below:

```
$ l | grep dotfiles

lrwxrwxrwx  1 rafael rafael   35 2020/02/21 13:28:17 .bash_aliases -> /home/rafael/dotfiles/.bash_aliases
lrwxrwxrwx  1 rafael rafael   29 2020/02/21 13:28:17 .bashrc -> /home/rafael/dotfiles/.bashrc
lrwxrwxrwx  1 rafael rafael   32 2020/02/21 13:28:17 .dircolors -> /home/rafael/dotfiles/.dircolors
drwxr-xr-x  7 rafael rafael 4,0K 2020/02/21 13:24:59 dotfiles/
lrwxrwxrwx  1 rafael rafael   19 2020/02/19 13:55:11 .functions -> dotfiles/.functions/
lrwxrwxrwx  1 rafael rafael   32 2020/02/21 13:28:17 .gitconfig -> /home/rafael/dotfiles/.gitconfig
lrwxrwxrwx  1 rafael rafael   32 2020/02/21 13:28:17 .gitignore -> /home/rafael/dotfiles/.gitignore
lrwxrwxrwx  1 rafael rafael   32 2020/02/21 13:28:17 .tmux.conf -> /home/rafael/dotfiles/.tmux.conf
lrwxrwxrwx  1 rafael rafael   28 2020/02/21 13:28:17 .vimrc -> /home/rafael/dotfiles/.vimrc
lrwxrwxrwx  1 rafael rafael   33 2020/02/21 13:28:17 .Xresources -> /home/rafael/dotfiles/.Xresources
```

## Functions list

* [Docker](docs/functions/docker.md)
* [GPG](docs/functions/gpg.md)
* [Git](docs/functions/git.md)
* [Vault](docs/functions/vault.md)

## Generating all functions

This piece below will generate all the functions in your terminal.

```
$ cat ${HOME}/dotfiles/.functions/* | \
grep -E '(^# [a-z A-Z]|[()] {)' | \
sed "s|[{]||g;/^$/d;s/^# /\n/g;s/^[a-z].*/\n\```&\```/;s|() \```|()\```|g"
```
