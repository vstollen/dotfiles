# Dotfiles
My dotfiles. Managed as described in this guide: https://www.atlassian.com/git/tutorials/dotfiles

## Installation
Set the `config` alias in the `.bashrc` or fish shell:
```sh
# Bash
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc

# Fish
alias -s config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Clone the dotfiles into a bare repository:
```sh
git clone --bare git@github.com:vstollen/dotfiles.git $HOME/.dotfiles
```

Checkout the repository contents into `$HOME`:
```sh
config checkout
```

Initialize and clone submodules:
```sh
git submodule update --init --recursive
```

Set the `showUntrackedFiles` to `no`:
```sh
config config --local status.showUntrackedFiles no
```
