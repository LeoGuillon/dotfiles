# ---------------------------------------------------------------------------------
# (PATH)
# ---------------------------------------------------------------------------------

export PATH="/opt/homebrew/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export PATH="/Users/leo.guillon/Library/Python/3.9/bin:$PATH"
export PATH="/Users/leo.guillon/dotfiles/bin:$PATH"

# ---------------------------------------------------------------------------------
# (ALIASES)
# ---------------------------------------------------------------------------------

alias reload='source ~/.zshrc'

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
  unimatrix -a -c black -f -l aAgGknnSSSS -s 92
}

deep () {
  let "time_minutes = ${1:-50}"

  osascript dotfiles/applescripts/work_session.scpt
  mtx -t $time_minutes
}
