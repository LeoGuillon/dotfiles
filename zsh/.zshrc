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
