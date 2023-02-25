# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Starship
eval "$(starship init zsh)"

# Config Management
# https://github.com/vstollen/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='/usr/bin/nvim'

# Tab completion for aliases
unsetopt completealiases
