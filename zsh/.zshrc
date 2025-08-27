export DOTFILES=$HOME/dotfiles

# configuration that works right out the box,
# maybe sometime for other apps such as tmux or homebrew
CONFIG_FILES=(
  aliases
  git
  homebrew
  johnny
  music
  navigation
  tmux
  vim_mode
)

# additional CLI tools configuration
PLUGIN_FILES=(
  eza
  fzf
  starship
  thefuck
  unimatrix
  yazi
  zoxide
  zsh-autopair
  zsh-autosuggestions
  zsh-syntax-highlighting
)

for filename in "${CONFIG_FILES[@]}"; do
  source "$DOTFILES/zsh/config/$filename.zsh"
done

for filename in "${PLUGIN_FILES[@]}"; do
  source "$DOTFILES/zsh/plugins/$filename.zsh"
done
