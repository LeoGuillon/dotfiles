bindkey -v

CONFIG_FILES=(
  aliases
  display
  git
  homebrew
  matrix
  navigation
  tmux
)

for filename in "${CONFIG_FILES[@]}"; do
  source "$ZDOTDIR/config/$filename.zsh"
done

# Created by `pipx` on 2025-02-19 19:06:41
export PATH="$PATH:/Users/leo/.local/bin"
eval "$(starship init zsh)"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
