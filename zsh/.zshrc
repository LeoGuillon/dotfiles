export PATH=$PATH:/Applications/Julia-1.6.app/Contents/Resources/julia/bin


# Created by `pipx` on 2024-12-27 23:09:22

# ---------------------------------------------------------------------------------
# (OPENING MESSAGE)
# ---------------------------------------------------------------------------------

# # Get the current hour in 24-hour format
# daytime=$(date +"%Hh%M")

# echo "      |\      _,,,---,,_"
# echo "ZZZzz /,\`.-'\`'    -.  ;-;;,_"
# echo "     |,4-  ) )-,_. ,\ (  \`'-'"
# echo "    '---''(_/--'  \`-'\_) $daytime"

# ---------------------------------------------------------------------------------
# (PROMPT)
# ---------------------------------------------------------------------------------

PS1="%1~ ⇒ "

# ---------------------------------------------------------------------------------
# (ALIASES)
# ---------------------------------------------------------------------------------

alias r='exec zsh'
alias q="exit"

# create a directory and move into it
md () {
  mkdir -p $1
  cd $1%
}

# homebrew
alias bi="brew install"
alias bic="brew install --cask"
alias bu="brew uninstall"
alias bs="brew search"
alias bl="brew list"

# unimatrix default
mtx () {
  # Récupérer le premier argument
  mode="${1:-default}"
  
  letters="aAgGknnnnnnnSSSSSSSSSSSSSSSSSSSS"
  custom="''"

  # Structure case
  case "$mode" in
      dev)
          letters="aAnSS"
          ;;
      calc)
          letters="nnnnu"
          custom="'+-÷×=$€'"
          ;;
      jap)
          letters="k"
          ;;
      type)
          letters="aaaaAu"
          custom="'ààâéèêœçôêîùûÂÉÈÊŒÇÔÊÎÙÛ-?.:…,;·!'"
          custom="'-?.:…,;·!'"
          ;;
      default)
          ;;
      *)
          echo "Mode invalide: $mode"
          echo "Modes disponibles: dev, calc, jap, type"
          return 0
          ;
  esac

  unimatrix -a -c black -f -s 92 -l $letters -u $custom
}

deep () {
  mode="${1:-default}"

  osascript dotfiles/applescripts/work_session.scpt
  mtx $mode
}

# yazi utils
export EDITOR="code"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
