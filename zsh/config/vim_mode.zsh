bindkey -v

export KEYTIMEOUT=1 # no delay when pressing <Esc>

# ──────────────────────────────────────────────────────────────────────────────
# CURSOR SHAPE depending on mode -> https://unix.stackexchange.com/a/614203

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
_fix_cursor() { echo -ne '\e[5 q'; }
precmd_functions+=(_fix_cursor)

# ────────────────────────────────────────────────────────────────────────────────
# KEYMAPS

# some small QoL mappings for time-to-time little vim mode in cmdline
bindkey -M vicmd 'U' redo
bindkey -M vicmd -s 'Y' 'y$'

# BUG: find correct syntax
# bindkey -M vicmd ',' ';'
# bindkey -M vicmd ';' ','
