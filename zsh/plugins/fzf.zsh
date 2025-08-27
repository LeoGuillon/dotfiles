
# options
export FZF_DEFAULT_COMMAND="fd --type f --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS=" \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--height 50% \
--border
--layout=default \
--multi
--preview=\"bat --color=always {}\""

export FZF_ALT_C_OPTS=" \
--preview 'eza --tree --icons=never --no-user --show-symlinks --sort=type {}'"

# removed background because transparent terminal
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \

# ────────────────────────────────────────────────────────────────────────────────
# (ALIASES)

alias f="fzf"

alias ni='nvim $(fzf)'

source <(fzf --zsh)
