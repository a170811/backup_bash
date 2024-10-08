# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
  *)
    #	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;33m\]\w\[\033[1;36m\]$(git_info)\[\033[00m\]\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
  *)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
  eval "`dircolors -b`"
  alias ls='_ls'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi


#### Handle dirty's Requirements

export EDITOR=vi
export GDFONTPATH="$HOME/share/fonts"
export LANG=zh_TW.UTF-8
export PYTHONPATH="/home/a170811/backup_bash/python_utils/"

# Standard Aliases

alias cls='clear'
alias cp='cp -i'
alias du='du -h --max-depth=1'
alias h='history | grep'
alias mv='mv -i'
alias rm='_rm'
alias rrm='/bin/rm -i'	# real rm
alias scr='screen -D -R'
alias vi='vim'
alias npms='npm start'
alias tx='tmux attach'
alias tls='tmux ls'
alias tre='function tre(){ tmux rename-session -t $1 $2 ; }; tre'

alias se='set'
alias en='encoding'
#
alias ptt='ssh bbsu@ptt.cc'
#
alias vir='function vir(){ source ~/.virtualenv/$1/bin/activate ; } ; vir'
alias venv='python3 -m venv ./.venv ; . ./.venv/bin/activate ; pip install --upgrade pip'
alias py="time python3"
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias mkcd='function _mkcd(){ mkdir $1 && cd $1 ;} ; _mkcd '
alias cc='function Ccompile(){ gcc $1 -o "output" && ./"output" ; } ; Ccompile'
alias cca='function CcompileA(){ gcc *.c -o "output" && ./"output" ; } ; CcompileA'
alias cpc='function Cpcompile(){ g++ $1 -o "output" && ./"output" ; } ; Cpcompile'
alias cpca='function CpcompileA(){ g++ *.cpp -o "output" && ./"output" ; } ; CpcompileA'
alias virc='vi ~/.bashrc'
alias sorc='source ~/.bashrc'
alias topub='function topub(){ ln -s $(pwd)/$1 ~/public_html/$2 ; }; topub'
alias viewcsv='viewcsv'

function viewcsv () { column -s, -t < $1 | less -#2 -N -S; }


#git
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m '
alias gcam='git commit -a -m '
alias gca='git commit --amend' #重新commit
alias gs='git status'
alias gss='git status -s'
alias grc='git rm --cached' #移除追蹤
alias gr='git reset'
alias gre='git reset HEAD^' #拆第一個commit
alias gch='git checkout '
alias gl='git log'
alias gb='git branch'
alias gll='git log --pretty=format:"%h - %an , %ar : %s"'
alias glg='git log --pretty=format:"%h - %s" --graph'
alias grs='git remote show origin'


# Personal Aliases

if [ -e $HOME/.alias ]; then
  . $HOME/.alias
fi

# Local Functions and Commands

function git_info {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;

now=`date +%s`;
sec=$((now-last_commit));
min=$((sec/60)); hr=$((min/60)); day=$((hr/24)); yr=$((day/365));
if [ $min -lt 60 ]; then
  info="${min}m"
elif [ $hr -lt 24 ]; then
  info="${hr}h$((min%60))m"
elif [ $day -lt 365 ]; then
  info="${day}d$((hr%24))h"
else
  info="${yr}y$((day%365))d"
fi

echo "(${ref#refs/heads/} $info)";
#	echo "(${ref#refs/heads/})";
}

function _ls() {
#LANG=zh_TW.BIG5
/bin/ls -C --color=always $@ | /usr/bin/iconv
#LANG=zh_TW.UTF-8
}

function old() {
day=$1; shift
find . -maxdepth 1 -mtime +${day} $@
}

function _rm() {
while [ $# -ge 1 ]; do
  mv -f "$1" $HOME/tmp
  echo "$1 deleted."
  shift
done
}

function rmold() {
find . -maxdepth 1 -mtime +$1 -exec rm -rf {} \;
}

detach_others() { tmux detach-client -a; }
