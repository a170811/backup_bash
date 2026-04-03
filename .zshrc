# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
alias rm='tmp_rm'
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
alias vir='function vir(){ source ~/.virtualenv/$1/bin/activate ; } ; vir'
alias venv='python3 -m venv ./.venv ; . ./.venv/bin/activate ; pip install --upgrade pip'
alias py="time python3"
alias gr="time go run"
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias mkcd='function _mkcd(){ mkdir $1 && cd $1 ;} ; _mkcd '
alias cc='function Ccompile(){ gcc $1 -o "output" && ./"output" ; } ; Ccompile'
alias virc='vi ~/.zshrc'
alias sorc='source ~/.zshrc'
alias viewcsv='viewcsv'
alias wclaude='CLAUDE_CONFIG_DIR=~/.claude-work claude'

function viewcsv () { column -s, -t < $1 | less -#2 -N -S; }

ping-claude() {
    local seconds=$(($1 * 3600))
    nohup bash -c "sleep $seconds && claude --model=haiku -p 'HI'" >/dev/null 2>&1 &
    echo "已排定於 $1 小時後執行。"
}


#git
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m '
alias gcam='git commit -a -m '
alias gca='git commit --amend' #重新commit
alias gs='git status'
alias gss='git status -s'
alias gre='git reset HEAD^' #拆第一個commit
alias gch='git checkout '
alias gl='git log'
alias gb='git branch'
alias gll='git log --pretty=format:"%h - %an , %ar : %s"'
alias glg='git log --pretty=format:"%h - %s" --graph'

function tmp_rm() {
while [ $# -ge 1 ]; do
  mv -f "$1" $HOME/tmp
  echo "$1 deleted."
  shift
done
}

function wt-create() {
    # 1. 初始化變數
    local opt_tmux=0
    local opt_claude=0
    local wt_name=""

    # 2. 使用迴圈解析參數，支援 name 放在任何位置
    for arg in "$@"; do
        case "$arg" in
            -t) opt_tmux=1 ;;
            -c) opt_claude=1 ;;
            -*) echo "❌ 未知參數: $arg"; return 1 ;;
            *)  wt_name="$arg" ;; # 非橫槓開頭的視為名稱
        esac
    done

    # 檢查是否有名稱
    if [[ -z "$wt_name" ]]; then
        echo "❌ 請提供 worktree 名稱"
        return 1
    fi

    # 3. 定義路徑與環境檢查
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "❌ 不在 Git 專案內"
        return 1
    fi

    local current_dir="$PWD"
    local repo_name="${current_dir:t}"
    local parent_dir="${current_dir:h}"
    local worktrees_base="${parent_dir}/${repo_name}-worktrees"
    local target_dir="${worktrees_base}/${wt_name}"

    # 4. 建立 Worktree
    mkdir -p "$worktrees_base"
    if ! git worktree add -b "$wt_name" "$target_dir"; then
        return 1
    fi

    # 5. 複製設定檔
    [[ -f "${current_dir}/.env" ]] && cp "${current_dir}/.env" "$target_dir/" && echo "✅ 已複製 .env"
    [[ -e "${current_dir}/.claude" ]] && cp -r "${current_dir}/.claude" "$target_dir/" && echo "✅ 已複製 .claude"

    # 6. 切換目錄 (因為是 Function，所以 cd 會直接生效)
    cd "$target_dir" || return 1
    echo "🚀 已進入: $target_dir"

    # 7. Tmux & Claude 邏輯 (確保先 tmux 後 claude)
    if [[ $opt_tmux -eq 1 ]]; then
        tmux new-session -d -s "$wt_name"
        [[ $opt_claude -eq 1 ]] && tmux send-keys -t "$wt_name" "claude" C-m

        if [[ -n "$TMUX" ]]; then
            tmux switch-client -t "$wt_name"
        else
            tmux attach-session -t "$wt_name"
        fi
    elif [[ $opt_claude -eq 1 ]]; then
        claude
    fi
}

# vi:nowrap:sw=4:ts=4
export PYTHONPATH="$HOME/backup_bash/python_utils/"
export PATH="$HOME/.local/bin:$PATH"
