echo "Adding .emacs.d/bin/ to PATH for doom commands"
echo "export PATH=\"\$PATH:~/.emacs.d/bin/\"" >> ~/.bashrc

echo "Initializing Doom through doom sync"
doom sync
