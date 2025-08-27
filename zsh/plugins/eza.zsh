export EZA_CONFIG_DIR=$DOTFILES/eza

alias ls="eza --git --long --icons=always --no-user --no-quotes --show-symlinks --modified --time-style='long-iso' --sort=type"

function tree {
  local level=${1:-3} # tree depth, defaults to 3
  eza --tree --level="$level" --icons=never --no-user --no-quotes --show-symlinks --sort=type
}
