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

eval "$(starship init zsh)"

# Created by `pipx` on 2025-02-20 14:40:25
export PATH="$PATH:/Users/leo.guillon/.local/bin"
