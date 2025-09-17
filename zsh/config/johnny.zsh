# this cd into johnny decimal system.
# cdj A -> cd into A0-A9
# cdj AC -> cd into AC
# cdj  AC.ID -> cd into AC.ID
# TODO: add option to cd into a different volume : dropbox, kobo, usb key, etc.
# TODO: add option to cd into a different system : A18/A25
cdj() {
  declare -A VOLUMES=(
    [default]="$HOME/"
    [cloud]="$HOME/Dropbox/"
  )

  declare -A SYSTEMES=(
    [default]="A18"
    [work]="A25"
  )

  local root="${VOLUMES[default]}/${SYSTEMES[default]}"
  local target="$1"

  # ────────────────────────────────────────────────────────────────────────────────
  # (ARGUMENTS PARSING)

  # while [[ $# -gt 0 ]]; do
  #   case "$1" in
  #   --volume=*)https://www.nordtheme.com/
  #     local vol="${1#*=}"
  #     if [[ -n "${VOLUMES[$vol]}" ]]; then
  #       root="${VOLUMES[$vol]}"
  #     else
  #       echo "Volume inconnu : $vol"
  #       echo "Volumes disponibles : ${!VOLUMES[@]}"
  #       return 1
  #     fi
  #     shift
  #     ;;
  #   --list-volumes)
  #     echo "Volumes disponibles :"
  #     for v in "${!VOLUMES[@]}"; do
  #       echo "  $v → ${VOLUMES[$v]}"
  #     done
  #     return 0
  #     ;;
  #   --help)
  #     echo "Usage : cdj [OPTIONS] <aire|catégorie|ID>"
  #     echo
  #     echo "Options :"
  #     echo "  --volume=<nom>       Utiliser un volume spécifique (default, cloud, usb, etc.)"
  #     echo "  --list-volumes       Afficher tous les volumes définis"
  #     echo "  --help               Afficher cette aide"
  #     echo
  #     echo "Exemples :"
  #     echo "  cdj 1                 → aire 10-19 sur le volume par défaut"
  #     echo "  cdj 10                → catégorie 10 sur le volume par défaut"
  #     echo "  cdj 11.13             → ID 11.13 sur le volume par défaut"
  #     echo "  cdj --volume=cloud 1  → aire 10-19 sur le volume cloud"
  #     return 0
  #     ;;
  #   -*)
  #     echo "Option inconnue : $1"
  #     return 1
  #     ;;
  #   *)
  #     target="$1"
  #     shift
  #     ;;
  #   esac
  # done

  if [[ -z "$target" ]]; then
    echo "Usage: cdj <aire|catégorie|ID>"
    return 1
  fi

  # ────────────────────────────────────────────────────────────────────────────────
  # (EXECUTION)

  local dir=""

  # Cas 1 : aire (ex: 1 → 10-19 …)
  if [[ "$target" =~ ^[0-9]$ ]]; then
    dir=$(find "$root" -maxdepth 1 -type d -regex ".*/${target}0-.*" | head -n 1)
  fi

  # Cas 2 : catégorie (ex: 10, 23 …)
  if [[ "$target" =~ ^[0-9]{2}$ ]]; then
    dir=$(find "$root" -mindepth 2 -maxdepth 2 -type d -regex ".*/$target .*" | head -n 1)
  fi

  # Cas 3 : ID (ex: 11.13)
  if [[ "$target" =~ ^[0-9]{2}\.[0-9]{2}$ ]]; then
    dir=$(find "$root" -mindepth 3 -maxdepth 3 -type d -regex ".*/$target .*" | head -n 1)
  fi

  if [[ -n "$dir" ]]; then
    cd "$dir" || return
  else
    echo "Aucun dossier trouvé pour $target"
    return 1
  fi
}
