#LS_OPTIONS='-lapbviT0 --color=always --time-style="+%Y/%m/%d %a %T %Z"'
LS_OPTIONS='-lahF --color=always --time-style="+%Y/%m/%d %T"'

alias     l="BLOCK_SIZE=\'1 ls $LS_OPTIONS"
alias cgrep="grep --color=always"
alias     h="history"
alias    du="time du -chs"
alias    df="df -haT"
alias  time="/usr/bin/time -f 'ELAPSED TIME: %E'"
alias  lynx="lynx -cfg=$HOME/.lynxrc"
alias     v="vault"
alias    vl="vault_login"
alias    kc="kubectl"