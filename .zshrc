# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles/.oh-my-zsh

zstyle ':omz:update' mode disabled  # disable automatic updates
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source <(fzf --zsh)

source $ZSH/oh-my-zsh.sh

# User configuration
#
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
# Aliases
# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias ls='eza'
alias l='eza -lh'
alias ll='eza -lah'
alias la='eza -A'
alias lm='eza -m'
alias lr='eza -R'
alias lg='eza -l --group-directories-first'

#cat
alias cat='bat'

#datascience utilities
alias ed="python ~/bin/utils/datascience/inital_exploratory.py"

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push -u origin main'
alias lzg='lazygit'

#zoxide
alias cd='z'

#custom
alias update='sudo pacman -Syyu'
alias code='vscodium'
alias fh='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse --preview="bat --color=always {}" | xargs -r nvim'
alias gdd='cd "$(fd --type d --hidden --exclude .git | fzf-tmux -p --reverse)"'
alias data='ccds ~/Templates/cookiecutter-data-science'
alias nk="tmux popup -E -w 80% -h 50% -x C -y C 'bat .config/nvim/lua/user/keymaps.lua'"
alias kd="python ~/scripts/utils/datascience/download_competition.py"

alias vactivate='source .venv/bin/activate'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shura/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shura/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shura/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shura/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$PATH:/home/johan/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin/"
export XDG_DATA_DIRS="$HOME/.local/bin:$XDG_DATA_DIRS"
export PATH="$PATH:$HOME/.zig"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

eval "$(register-python-argcomplete pipx)"


# Created by `pipx` on 2025-03-20 21:08:16
export PATH="$PATH:/home/shura/.local/bin"
