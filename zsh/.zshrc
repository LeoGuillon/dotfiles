export DOTFILES=$HOME/dotfiles

export STARSHIP_CONFIG=$DOTFILES/starship/starship.toml

export WEZTERM_CONFIG_DIR=$DOTFILES/wezterm
export WEZTERM_CONFIG_FILE=$DOTFILES/wezterm/wezterm.lua

export YAZI_CONFIG_HOME=$DOTFILES/yazi

CONFIG_FILES=(
  aliases
  catppuccin_mocha-zsh-syntax-highlighting
  eza
  fzf
  git
  homebrew
  johnny
  matrix
  navigation
  tmux
  vim_mode
)

for filename in "${CONFIG_FILES[@]}"; do
  source "$DOTFILES/zsh/config/$filename.zsh"
done

eval "$(starship init zsh)"
eval "$(thefuck --alias fuck)"
eval "$(zoxide init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^I' autosuggest-accept

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
