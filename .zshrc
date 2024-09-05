# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

autoload -Uz compinit
compinit

# Starship prompt
eval "$(starship init zsh)"

# Autosuggestions
if [[ -e /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

eval "$(zoxide init zsh)"

source <(fzf --zsh)

# Config Management
alias vim='nvim'

# Dotfile Management
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Faster git completion (from the official git repo)
# https://git.kernel.org/pub/scm/git/git.git/plain/contrib/completion/git-completion.zsh
fpath=(~/.zsh $fpath)

# Tab completion for aliases
unsetopt completealiases

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[ -f "/Users/vincentstollenwerk/.ghcup/env" ] && . "/Users/vincentstollenwerk/.ghcup/env" # ghcup-env
