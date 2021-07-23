#!/bin/fish

echo "Adding .emacs.d/bin/ to PATH for doom commands"
set -U fish_user_paths .emacs.d/bin/ $fish_user_paths

echo "Initializing Doom through doom sync"
doom sync
