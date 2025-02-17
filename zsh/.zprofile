
eval "$(/opt/homebrew/bin/brew shellenv)"

export VIMINIT=source $MYVIMRC
export MYVIMRC=$HOME/dotfiles/vim/.vimrc

export WEZTERM_CONFIG_DIR=$HOME/dotfiles/wezterm
export WEZTERM_CONFIG_FILE=$HOME/dotfiles/wezterm/wezterm.lua

export YAZI_CONFIG_HOME=$HOME/dotfiles/yazi

# to run if espanso not setup yet
# ln -s "$HOME/dotfiles/espanso" "$HOME/Library/Application Support"
