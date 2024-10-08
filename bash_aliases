# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    COLOR="--color=auto"
else
    COLOR=""
fi

alias {cl,cls}="clear"

alias dir="dir -F ${COLOR}"
alias vdir="vdir -F ${COLOR}"

alias ls="ls -F ${COLOR}"
alias l="ls"
alias la="ls -A"
alias ll="ls -l"
alias {lla,lal}="ls -Al"

alias h{,i,is,ist}="history"
alias h{o,off}="set +o history"

alias grep="grep ${COLOR}"
alias fgrep="fgrep ${COLOR}"
alias egrep="egrep ${COLOR}"

#alias ls='ls -Av --time-style="+%Y-%h-%d %r" --group-directories-first --color'
#alias ll='ls -lh'

alias vi="/usr/bin/vim"

# Easy Vim mode !
alias vimy="/usr/bin/vim -y"

# sqlite with uparrow
alias sqlite3="rlwrap -c sqlite3"

# useful curl aliases (https://news.ycombinator.com/item?id=40869458)
# alias wcurl="curl -# -O $1"
# alias wcurl = curl -# -O $1 --location --remote-name --remote-time --retry 10 --retry-max-time 10 --continue-at -"

# git log
alias glg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


