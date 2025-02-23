export DOTFILES=$HOME/dotfiles
eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2025-02-20 14:40:25
export PATH="$PATH:/Users/leo.guillon/.local/bin"
# export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# not finished yet
# export VIMINIT=source $MYVIMRC
# export MYVIMRC=$HOME/dotfiles/vim/.vimrc

export EDITOR="code"

export STARSHIP_CONFIG=$DOTFILES/starship/starship.toml

export TMUX_CONFIG_DIR=$DOTFILES/tmux
export TMUX_CONFIG_FILE=$DOTFILES/tmux/tmux.conf

export WEZTERM_CONFIG_DIR=$DOTFILES/wezterm
export WEZTERM_CONFIG_FILE=$DOTFILES/wezterm/wezterm.lua

export YAZI_CONFIG_HOME=$DOTFILES/yazi

# to run if espanso not setup yet
# ln -s "$DOTFILES/espanso" "$HOME/Library/Application Support"
# ln -s "$DOTFILES/tmux" "$HOME/.config"
# ln -s "$DOTFILES/wezterm" "$HOME/.config"

