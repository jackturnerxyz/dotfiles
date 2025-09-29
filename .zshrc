# A custom prompt
export ZSH="$HOME/.oh-my-zsh"
autoload -U colors && colors
PROMPT="[%{$fg[white]%}%n@%m %{$fg[blue]%}%c]>%{$reset_color%} "
export PATH="$PATH:/home/jack/.local/bin/"

export HISTFILE=~/.zsh_history  # Specifies the history file location
export HISTSIZE=100000          # Maximum number of history lines to keep in memory
export SAVEHIST=100000          # Maximum number of history lines to save to file
setopt APPEND_HISTORY           # Appends new history lines to the file
setopt INC_APPEND_HISTORY       # Adds commands to history as they are executed
setopt SHARE_HISTORY            # Shares history among all active Zsh sessions
setopt EXTENDED_HISTORY
# Enable colored completion
zstyle ':completion:*' list-colors ''

setopt autocd
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
)
source $ZSH/oh-my-zsh.sh

alias dsem="doas emerge"
