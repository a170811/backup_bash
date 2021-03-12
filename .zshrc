# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/a170811/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="risto"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Standard Aliases
alias cls='clear'
alias cp='cp -i'
alias du='du -d 1 -h'
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
alias virc='vi ~/.zshrc'
alias sorc='source ~/.zshrc'
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

alias merry='ssh merry.ee.ncku.edu.tw'
alias luffy='ssh luffy.ee.ncku.edu.tw'
alias sunny='ssh sunny.ee.ncku.edu.tw'
alias paper='rsync -ravh --exclude=.venv --exclude=__pycache__ --exclude=data --exclude=tmp --delete a170811@merry.ee.ncku.edu.tw:~/paper/ /Users/a170811/working/paper/'
alias paperr='rsync -ravh --exclude=.venv --exclude=__pycache__ --exclude=data --exclude=tmp --delete /Users/a170811/working/paper/ a170811@merry.ee.ncku.edu.tw:~/paper/'

function _rm() {
while [ $# -ge 1 ]; do
  mv -f "$1" $HOME/tmp
  echo "$1 deleted."
  shift
done
}

# vi:nowrap:sw=4:ts=4
export PYTHONPATH="/home/a170811/my_tools/"
