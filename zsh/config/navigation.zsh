# DOCS
# https://blog.meain.io/2023/navigating-around-in-shell/
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
# ref : https://github.com/chrisgrieser/.config/blob/82b9f87670d2a3cd80876f0092e891f51ffaf6f4/zsh/config/navigation.zsh
#───────────────────────────────────────────────────────────────────────────────

# ──────────────────────────────────────────────────────────────────────────────
# OPTIONS

setopt CD_SILENT   # don’t echo the directory
setopt CHASE_LINKS # follow symlinks on cd

# ──────────────────────────────────────────────────────────────────────────────
# UTILS

# HARPOOOOOON in the cmdline !
# go to jds or dotfiles
# TODO: setup a keybinding for harpoon
function harpoon {
  local target="$HOME/A18"
  [[ "$PWD" == "$target" ]] && target="$DOTFILES"

  cd -q "$target" || return 1
}

# ──────────────────────────────────────────────────────────────────────────────
# ALIASES

alias ..=" cd .."
alias ...=" cd ../.."
alias ....=" cd ../../.."

alias ..g=' cd "$(git rev-parse --show-toplevel)"' # goto git root

alias h="harpoon"

# create a directory and move into it
function mcd {
  mkdir -p $1
  cd $1
}

# creates a file and opens it right away
function topen {
  touch "$1" && $EDITOR "$1"
}
