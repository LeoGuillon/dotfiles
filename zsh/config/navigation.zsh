# DOCS
# https://blog.meain.io/2023/navigating-around-in-shell/
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
# ref : https://github.com/chrisgrieser/.config/blob/82b9f87670d2a3cd80876f0092e891f51ffaf6f4/zsh/config/navigation.zsh
#───────────────────────────────────────────────────────────────────────────────

# ---------------------------------------------------------------------------------
# (FILES AND FOLDERS NAVIGATION)
# ---------------------------------------------------------------------------------

eval "$(zoxide init zsh)"

# uses zoxide as default cd
alias cd="z"
alias cdi="zi"

alias ..=" cd .."
alias ...=" cd ../.."

# create a directory and move into it
function mcd {
  mkdir -p $1
  cd $1
}

# creates a file and opens it right away
function topen {
  touch "$1" && $EDITOR "$1"
}
# ---------------------------------------------------------------------------------
# (YAZI)
# ---------------------------------------------------------------------------------

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
