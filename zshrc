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

source $ZSH/oh-my-zsh.sh

bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

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

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

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

alias update_powerlevel10k='git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull'

alias tmpdir="${TMPDIR:-/tmp}"
alias rmweather='rm "/tmp/.dracula-tmux-weather-last-exec"'

killzombies() {
  pids=$(ps -A -ostat,ppid | awk '/[zZ]/ && !a[$2]++ {print $2}');

  if [ -z "$pids" ]; then
    echo "No zombie processes found.";
  else
    echo "Found zombie processes with PID: $pids";
    echo "$cmd";
    echo "Kill it? Return to continue… (ctrl+c to cancel)";
    read -r;
    kill $pids;
  fi
}

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
  curl -s https://russianwarship.rip/api/v2/statistics/latest | jq -r '.data.date as $date | .data.stats as $stats | .data.increase as $increase | "\($date): \($stats.personnel_units) дохлої русні (+\($increase.personnel_units) за попередню добу)"'
}

rate.sx() {
  curl -H "Accept-Language: uk" https://rate.sx/$1
}

wakatime() {
  curl -s "https://wakatime.com/api/v1/users/mamantoha/status_bar/today?api_key=$(grep -i 'api_key' ~/.wakatime.cfg | awk -F '= ' '{print $2}' | tr -d '\r\n')" | jq -r '"Today'\''s coding time: \(.data.grand_total.text)"'
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
  export PATH="/opt/homebrew/opt/llvm@15/bin:$PATH"
  eval "$(/opt/homebrew/bin/brew shellenv)"
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

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
