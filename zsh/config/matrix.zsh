# unimatrix default
function mtx {
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

  osascript $DOTFILES/applescripts/work_session.applescript
  # mtx $mode
}
