source ~/.zsh/directories.zsh
source ~/.zsh/git.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/sudo.plugin.zsh

#plugins=(git npm node gitignore sudo zsh-autosuggestions zsh-completions vi-mode zsh-syntax-highlighting fzf)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export EDITOR='nvim'
export VISUAL='nvim'

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

alias pip=pip3
alias vsc='code --enable-features=UseOzonePlatform --ozone-platform=wayland .'
alias H=Hyprland

# compsys initialization
autoload -Uz compinit
compinit

# Custom key binds
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

# Salesforce cli autocomplete
eval
SF_AC_ZSH_SETUP_PATH=/home/lechu/.cache/sf/autocomplete/zsh_setup && test -f $SF_AC_ZSH_SETUP_PATH && source $SF_AC_ZSH_SETUP_PATH; # sf autocomplete setup

eval "$(zoxide init zsh)"
