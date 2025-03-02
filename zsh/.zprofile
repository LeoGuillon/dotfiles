export DOTFILES=$HOME/dotfiles
eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2025-02-20 14:40:25
export PATH="$PATH:/Users/leo.guillon/.local/bin"
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


export EDITOR="nvim"

export STARSHIP_CONFIG=$DOTFILES/starship/starship.toml

export TMUX_CONFIG_DIR=$DOTFILES/tmux
export TMUX_CONFIG_FILE=$DOTFILES/tmux/tmux.conf

# export VIMINIT='source $VIM_CONFIG'
# export VIM_CONFIG=$DOTFILES/vim/.vimrc

export WEZTERM_CONFIG_DIR=$DOTFILES/wezterm
export WEZTERM_CONFIG_FILE=$DOTFILES/wezterm/wezterm.lua

export YAZI_CONFIG_HOME=$DOTFILES/yazi

# ln -s "$DOTFILES/espanso" "$HOME/Library/Application Support"
# ln -s "$DOTFILES/obsdian/vimrc/.obsidian.vimrc" "$HOME/dev/obsidian/BrainVerse/.obsidian.vimrc"
# ln -s "$DOTFILES/tmux" "$HOME/.config"
# ln -s "$DOTFILES/wezterm" "$HOME/.config"
