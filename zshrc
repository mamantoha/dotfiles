# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  sudo
  command-not-found
  zsh-syntax-highlighting
  zsh-autosuggestions
  git-auto-fetch
)

# User configuration

# export PATH="/home/mama/.rvm/gems/ruby-2.3.1@rails-rest-api/bin:/home/mama/.rvm/gems/ruby-2.3.1@global/bin:/home/mama/.rvm/rubies/ruby-2.3.1/bin:/home/mama/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt noincappendhistory
setopt nosharehistory
setopt nobeep

# When searching for history, do not display duplicates of a line previously found
setopt HIST_FIND_NO_DUPS

zstyle ':completion:*' insert-tab false

# if type nvim > /dev/null 2>&1; then
#   alias vim='nvim'
#   export VISUAL="nvim"
# else
#   export VISUAL="vim"
# fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ip='ip --color=auto'
alias ncmpc='ncmpc --no-colors'

man() {
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}

alias grep='grep --color=auto'

alias tmux='env TERM=screen-256color tmux'

wttr() {
  curl -H "Accept-Language: uk" https://wttr.in/$1
}

wttr2() {
  curl -H "Accept-Language: uk" https://v2.wttr.in/$1
}

timein() {
  dig $1\.time @dns.toys
}

weatherin() {
  dig $1\.weather @dns.toys
}

dr() {
  curl -s https://uadata.net/ukraine-russia-war-2022/people.json | jq -r '.data[-1] | "\(.at): \(.val) дохлої русні"'
}

rate.sx() {
  curl -H "Accept-Language: uk" https://rate.sx/$1
}

export TERM="xterm-256color"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

OS=`uname -a`

if [[ "$OS" =~ "Darwin" ]]; then
  PATH=$PATH:/usr/local/sbin
  PATH=$HOME/Library/Python/3.10/bin:$PATH

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
elif [[ "$OS" =~ "Linux" ]]; then
  if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
  fi
  if [ -d "/snap/bin" ]; then
    PATH="/snap/bin:$PATH"
  fi

else
  # Unknown
fi

export KSCREEN_LOGGING=0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
