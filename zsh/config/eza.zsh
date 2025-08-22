export EZA_CONFIG_DIR=$DOTFILES/eza

alias ls="eza --git --long --icons=always --no-user --show-symlinks --modified --time-style='long-iso' --sort=type"
alias lsa="ls --all"


# TODO: setup eza with tree -> lst ? tree ?
alias tree="eza --tree --icons=never --no-user --show-symlinks --sort=type"
