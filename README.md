# Dotfiles (Rafael Dutra)

My all dotfiles used on bash

## How to install

The command below will download the Makefile and then run it.

```
$ curl -OLs https://raw.githubusercontent.com/raffaeldutra/dotfiles/master/Makefile && make -s clone && make dotfiles
```

This will create a `dotfile` directory where you are downloading it and then it will create all the links needed for all files.

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

```
$ cat ${HOME}/.functions/* | grep -E '(^# [a-z A-Z]|[()] {)' | sed "s|[{]||g;/^$/d;s/^# /\n/g;s/^[a-z].*/\**&\**/;s|() \**|()\**|g"
```

Automate my docs :D
**docker_make_chapter()**

Apache benchmark. This function must receive a parameter
**docker_ab()**

If you did something wrong, a.k.a commited using wrong email/credential
**git_change_commiter()**

Show on terminal my personal credentials for git
**git_personal_config()**

Show general credential for git
**git_general_config()**

Generate a new key and print it on terminal
**gpg_generate_key()**

List all keys founded
**gpg_list_keys()**

Delete a key using the ID
**gpg_delete_key_by_id ()**

Export a key using the ID. It can be used using the function gpg_list_keys to retrieve IDs keys
**gpg_export_by_id()**
```
