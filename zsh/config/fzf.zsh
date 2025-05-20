eval "$(fzf --zsh)"

alias f="fzf"
# BUG: script not working, to fix at some point
alias nf="$DOTFILES/zsh/scripts/fzf_listoldfiles.zsh"
alias ncd="$DOTFILES/zsh/scripts/zoxide_openfiles_nvim.zsh"

# options
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--height 50% \
--border
--layout=default \
--multi"

