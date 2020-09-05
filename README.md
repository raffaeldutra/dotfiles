<p align="center"><img src="https://github.com/raffaeldutra/dotfiles/blob/master/dotfiles.png" width="400"></p>

# Dotfiles (Rafael Dutra)

My all dotfiles used on bash Linux, please feel free to change it, if you want.

## How to install

The command below will download the Makefile and then run it.

```
$ curl -OLs https://raw.githubusercontent.com/raffaeldutra/dotfiles/master/Makefile && make
```

This will create a `dotfiles` directory where you are downloading it and then it will create all the links needed for all files.

At the end, you'll get a structure ~like below:

```
$ l | grep dotfiles

lrwxrwxrwx  1 rafael rafael   35 2020/03/18 00:52:48 .bash_aliases -> /home/rafael/dotfiles/.bash_aliases
lrwxrwxrwx  1 rafael rafael   35 2020/03/18 00:52:48 .bash_profile -> /home/rafael/dotfiles/.bash_profile
lrwxrwxrwx  1 rafael rafael   29 2020/03/18 00:52:48 .bashrc -> /home/rafael/dotfiles/.bashrc
lrwxrwxrwx  1 rafael rafael   32 2020/03/18 00:52:48 .dircolors -> /home/rafael/dotfiles/.dircolors
lrwxrwxrwx  1 rafael rafael   52 2020/03/18 00:52:48 docker_functions.sh -> /home/rafael/dotfiles/.functions/docker_functions.sh
drwxr-xr-x  9 rafael rafael 4,0K 2020/03/18 00:58:58 dotfiles/
lrwxrwxrwx  1 rafael rafael   44 2020/02/22 15:43:36 .fonts -> /mnt/sda/devel/raffaeldutra/dotfiles/.fonts//
lrwxrwxrwx  1 rafael rafael   42 2020/02/19 22:29:24 fonts -> /mnt/sda/devel/raffaeldutra/dotfiles/fonts/
lrwxrwxrwx  1 rafael rafael   47 2020/02/22 15:44:17 .functions -> /mnt/sda/devel/raffaeldutra/dotfiles/.functions/
lrwxrwxrwx  1 rafael rafael   32 2020/03/18 00:52:48 .gitconfig -> /home/rafael/dotfiles/.gitconfig
lrwxrwxrwx  1 rafael rafael   49 2020/03/18 00:52:48 git_functions.sh -> /home/rafael/dotfiles/.functions/git_functions.sh
lrwxrwxrwx  1 rafael rafael   32 2020/03/18 00:52:48 .gitignore -> /home/rafael/dotfiles/.gitignore
lrwxrwxrwx  1 rafael rafael   49 2020/03/18 00:52:48 gpg_functions.sh -> /home/rafael/dotfiles/.functions/gpg_functions.sh
lrwxrwxrwx  1 rafael rafael   32 2020/03/18 00:52:48 .tmux.conf -> /home/rafael/dotfiles/.tmux.conf
lrwxrwxrwx  1 rafael rafael   51 2020/03/18 00:52:48 vault_functions.sh -> /home/rafael/dotfiles/.functions/vault_functions.sh
lrwxrwxrwx  1 rafael rafael   28 2020/03/18 00:52:48 .vimrc -> /home/rafael/dotfiles/.vimrc
lrwxrwxrwx  1 rafael rafael   33 2020/03/18 00:52:48 .Xresources -> /home/rafael/dotfiles/.Xresources
```

## Testing without installing it (Docker)

You can test it inside a Docker container.

```
docker container run \
-it \
-w /tmp \
-v $(pwd):/tmp \
raffaeldutra/dotfiles \
make
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
