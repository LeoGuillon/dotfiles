bindkey -v

export DOTFILES=$HOME/dotfiles

export BAT_THEME="Catppuccin Mocha"

export STARSHIP_CONFIG=$DOTFILES/starship/starship.toml

export TMUX_CONFIG_DIR=$DOTFILES/tmux
export TMUX_CONFIG_FILE=$DOTFILES/tmux/tmux.conf

export WEZTERM_CONFIG_DIR=$DOTFILES/wezterm
export WEZTERM_CONFIG_FILE=$DOTFILES/wezterm/wezterm.lua

export YAZI_CONFIG_HOME=$DOTFILES/yazi

# ln -s "$DOTFILES/espanso" "$HOME/Library/Application Support"
# ln -s "$DOTFILES/obsdian/vimrc/.obsidian.vimrc" "$HOME/dev/obsidian/BrainVerse/.obsidian.vimrc"
# ln -s "$DOTFILES/tmux" "$HOME/.config"
# ln -s "$DOTFILES/wezterm" "$HOME/.config"

CONFIG_FILES=(
  aliases
  catppuccin_mocha-zsh-syntax-highlighting
  eza
  fzf
  git
  homebrew
  matrix
  navigation
  tmux
)

for filename in "${CONFIG_FILES[@]}"; do
  source "$DOTFILES/zsh/config/$filename.zsh"
done

eval "$(starship init zsh)"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^I' autosuggest-accept

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
