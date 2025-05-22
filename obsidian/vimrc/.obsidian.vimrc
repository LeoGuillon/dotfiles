" ——————————————————————————————————————————————————————————————————————————————

" Esc cleans the command line and highlights
" source : https://nanotipsforvim.prose.sh/esc-in-normal-mode
nnoremap <Esc> :nohl<CR>

" ——————————————————————————————————————————————————————————————————————————————
" (EDITION)
" ——————————————————————————————————————————————————————————————————————————————

" ——————————————————————————————————————————————————————————————————————————————
" (YANKING AND PASTING)

" yank to system clipboard
set clipboard=unnamed

" move the delete and change to the black hole register
" credits : https://nanotipsforvim.prose.sh/keeping-your-register-clean-from-dd
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C
nnoremap s "_cl
" no mapping to S as it's used later in surround

" yank from cursor to the end of line
nnoremap Y y$

" paste at the end of line
" instead of behind the cursor, for more coherence with other commands
nnoremap P mzg$p`z

" in visual mode, paste over selection uses the custom ex command pasteinto
vnoremap p :pasteinto<CR>


" togglecase command doesn't move forward a character
nnoremap ~ v~

" ——————————————————————————————————————————————————————————————————————————————
" (UNDO/REDO)

" redo on U instead of <C-r>
nnoremap U <C-r>

" " undo checkpoints during text writing
" inoremap . .<C-g>u
" inoremap ! !<C-g>u
" inoremap ? ?<C-g>u
" inoremap ; ;<C-g>u
" inoremap : :<C-g>u

" ——————————————————————————————————————————————————————————————————————————————
" (NEW LINES)

" new line above or below without entering insert mode
nnoremap gn mzo<Esc>`z
nnoremap gN mzO<Esc>`z

" ——————————————————————————————————————————————————————————————————————————————
" (MOVING CHARACTERS)

nnoremap <A-Left> xhhp
nnoremap <A-Right> xp

" ——————————————————————————————————————————————————————————————————————————————
" (MOVING LINES)

exmap lineUp obcommand editor:swap-line-up
exmap lineDown obcommand editor:swap-line-down
nnoremap <A-Down> :lineDown<CR>
nnoremap <A-Up> :lineUp<CR>

" ────────────────────────────────────────────────────────────────────────────────
" (COMMENTS)

exmap togglecomment obcommand editor:
" nnoremap gcc :togglecomment<CR>
vnoremap gc :togglecomment<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (ERGO-L LAYOUT SPECIFIC KEYMAPS)
" ——————————————————————————————————————————————————————————————————————————————
" credits : https://ergol.org/articles/vim_pour_les_ergonautes/

" swap line navigation to account for shifted and non-shifted characters
nnoremap , ;
nnoremap ; ,

" jump history next to each other
nnoremap <C-c> <C-i>

" ——————————————————————————————————————————————————————————————————————————————
" (PERSONAL IMPROVEMENTS)

" find previous on \
" due to the symmetry between \ and / on symbol layer
nnoremap \ ?

" increment/decrement on +/-
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap g+ g<C-a>
nnoremap g- g<C-x>

" remapping of hjkl to other functions
" [j]oin lines
nnoremap j J
nnoremap gj gJ
nnoremap J kJ
nnoremap gJ kgJ

" ——————————————————————————————————————————————————————————————————————————————
" (VISUAL MODE)

" double v to enter visual block mode
vnoremap v <C-v>

" enter V multiple times to select multiple lines
vnoremap V j

" indenting in visual mode keeps the selection on
vnoremap > >gv
vnoremap < <gv

" ——————————————————————————————————————————————————————————————————————————————
" (CASING)

" toggle case without moving forward
nnoremap ~ v~

" ───────────────────────────────────────────────────────────────────────────────
" (NAVIGATION)
" ───────────────────────────────────────────────────────────────────────────────

" ───────────────────────────────────────────────────────────────────────────────
" (IN-FILE NAVIGATION)

" navigation on visual lines
nnoremap <Up> gk
nnoremap <Down> gj
" nnoremap I g0i
" nnoremap A g$a

" fast vertical navigation
" credits : https://nanotipsforvim.prose.sh/vertical-navigation-%E2%80%93-without-relative-line-numbers
nnoremap <S-Left> g0
nnoremap <S-Down> 6gj
nnoremap <S-Up> 6gk
nnoremap <S-Right> g$

vnoremap <S-Left> 0
vnoremap <S-Down> 6j
vnoremap <S-Up> 6k
vnoremap <S-Right> $

" going to next/previous search results centers the screen
nnoremap n nzz
nnoremap N Nzz

" page up/down with cursor centered
nnoremap <PageDown> <c-d>zz
nnoremap <PageUp> <c-u>zz
nnoremap <S-PageDown> <c-f>zz
nnoremap <S-PageUp> <c-b>zz

" ───────────────────────────────────────────────────────────────────────────────
" (INTER-FILE NAVIGATION)

exmap nexttab obcommand workspace:next-tab
nnoremap gt :nexttab<CR>

exmap previoustab obcommand workspace:previous-tab
nnoremap gT :previoustab<CR>

" [g]o to [f]ile (in a new tab)
" [x] as well to mimic the gx command in Vim for links
exmap openlink obcommand editor:open-link-in-new-leaf
nnoremap gf :openlink<CR>
nnoremap gx :openlink<CR>

" close tab
exmap closetab obcommand workspace:close
nnoremap ZZ :closetab<CR>

" close window
exmap closewindow obcommand obsidian-git:backup-and-close
nnoremap ZQ :closewindow<CR>

" forward/backward in the history
exmap goBack obcommand app:go-back
exmap goForward obcommand app:go-forward
noremap <BS> :goBack<CR>
noremap <S-BS> :goForward<CR>

" ────────────────────────────────────────────────────────────────────────────────
" (PANE MANIPULATION)

" navigation
exmap focusleft obcommand editor:focus-left
nnoremap <C-Left> :focusleft<CR>

exmap focusdown obcommand editor:focus-bottom
nnoremap <C-Down> :focusdown<CR>

exmap focusup obcommand editor:focus-top
nnoremap <C-Up> :focusup<CR>

exmap focusright obcommand editor:focus-right
nnoremap <C-Right> :focusright<CR>

" splitting
exmap splithorizontal obcommand workspace:split-horizontal
nnoremap <C-v> :splithorizontal<CR>

exmap splitvertical obcommand workspace:split-vertical
nnoremap <C-h> :splitvertical<CR>

" ───────────────────────────────────────────────────────────────────────────────
" (FOLDS)
" ───────────────────────────────────────────────────────────────────────────────

" classic folds
exmap togglefold obcommand editor:toggle-fold
nnoremap zo :togglefold<CR>

exmap foldreduce obcommand editor:fold-less
nnoremap zr :foldreduce<CR>

exmap unfoldall obcommand editor:unfold-all
nnoremap zR :unfoldall<CR>

exmap foldmore obcommand editor:fold-more
nnoremap zm :foldmore<CR>

exmap foldall obcommand editor:fold-all
nnoremap zM :foldall<CR>

" properties
exmap togglefoldproperties obcommand editor:toggle-fold-properties
nnoremap zp :togglefoldproperties<CR>


" ───────────────────────────────────────────────────────────────────────────────
" (TEXT OBJECTS)
" ───────────────────────────────────────────────────────────────────────────────

" remapped text objects
" credits : https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed
" reminder : already existing text objects
" [l]etter (e.g. character)
" [w]ord
" [s]entence
" [p]aragraph
" [t]ag
" [b]rackets

" [q]uoted text
onoremap iq i"
onoremap aq a"
vnoremap iq i"
vnoremap aq a"

" single quoted text ([a]postrothe in french)
onoremap ia i'
onoremap aa a'
vnoremap ia i'
vnoremap aa a'

" [i]nline code
onoremap ii i`
onoremap ai a`
vnoremap ii i`
vnoremap ai a`

" [c]urly brackets
onoremap ic iB
onoremap ac aB
vnoremap ic iB
vnoremap ac aB

" [r]ectangular brackets
onoremap ir i]
onoremap ar a]
vnoremap ir i]
vnoremap ar a]

" wikipedia lin[k]
onoremap ik i]
onoremap ak a]
vnoremap ik i]
vnoremap ak a]

" che[v]rons
onoremap iv i>
onoremap av a>
vnoremap iv i>
vnoremap av a>

" [m]ath block
onoremap im i$
onoremap am a$
vnoremap im i$
vnoremap am a$



" ——————————————————————————————————————————————————————————————————————————————
" (SURROUND)
" ——————————————————————————————————————————————————————————————————————————————

" source : https://github.com/esm7/obsidian-vimrc-support
" I do use the 's' keymap in vim, so better to map the surround to 'S'
" morover, this is the same mapping in visual mode as nvim-surround
nunmap S
vunmap S

exmap surround_brackets surround ( )
map Sb :surround_brackets<CR>

exmap surround_curly_brackets surround { }
map Sc :surround_curly_brackets<CR>

exmap surround_rectangular_brackets surround [ ]
map Sr :surround_rectangular_brackets<CR>

exmap surround_quotes surround " "
map Sq :surround_quotes<CR>

exmap surround_apostrophe_quotes surround ' '
map Sa :surround_apostrophe_quotes<CR>

exmap surround_inline_code surround ` `
map Si :surround_inline_code<CR>

exmap surround_guillemets surround « »
map Sg :surround_guillemets<CR>

exmap surround_wiki_link surround [[ ]]
map Sk :surround_wiki_link<CR>

exmap surround_chevrons surround < >
map Sv :surround_chevrons<CR>

exmap surround_math surround $ $
map Sm :surround_math<CR>


" ───────────────────────────────────────────────────────────────────────────────
" (LEADER MAPPINGS)
" ───────────────────────────────────────────────────────────────────────────────

" Can’t set a leader key, so every occurence must be written by hand
unmap <Space>

" adding a , ; or . at the end of line
nnoremap <Space>, mzA,<Esc>`z
nnoremap <Space>; mzA<Space>;<Esc>`z
nnoremap <Space>. mzA.<Esc>`z

" quick toggle casing ; credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
nnoremap <Space>~ mzlblgueh~`z


" ——————————————————————————————————————————————————————————————————————————————
" (NOTE CREATION)
" [n]ew…

" [b]ook
exmap newbook obcommand obsidian-book-search-plugin:open-book-search-modal
nnoremap <Space>nb :newbook<CR>

" [c]anvas
exmap newcanvas obcommand canvas:new-file
nnoremap <Space>nc :newcanvas<CR>


" [n]ote
exmap newnote obcommand file-explorer:new-file
nnoremap <Space>nn :newnote<CR>

" [r]ecipe

" tab : useful for other following commands
exmap newtab obcommand workspace:new-tab

" [t]emplate
exmap newnotefromtemplate obcommand templater-obsidian:create-new-note-from-template
nnoremap <Space>nt :newnotefromtemplate<CR>

" [w]ikipedia extraction
exmap newwikipedia obcommand obsidian-wikipedia:wikipedia-get-search-term
nnoremap <Space>nw :newwikipedia<CR>

" [y]outube video note
exmap newyoutube obcommand youtube-template:youtube-insert-template
nnoremap <Space>ny :newyoutube<CR>

" [z]otero reference
" TODO: check if space isn't a problem
exmap newzotero obcommand obsidian-zotero-desktop-connector:zdc-exp-Create new litterature note
nnoremap <Space>nz :newzotero<CR>

" ——————————————————————————————————————————————————————————————————————————————
" (INSERTION)
" [i]nsert…

" NOTE: we add “i” at the end of each command to be in insert mode right away

" ta[b]le
exmap inserttable obcommand editor:insert-table
nnoremap <Space>ib :inserttable<CR>i

" [c]allout
exmap insertcallout obcommand editor:insert-callout
nnoremap <Space>ic :insertcallout<CR>i

" wiki lin[k]
exmap insertwikilink obcommand editor:insert-wikilink
nnoremap <Space>ik :insertwikilink<CR>i

" [m]ath block
exmap insertmathblock obcommand editor:insert-mathblock
nnoremap <Space>im :insertmathblock<CR>i

" [t]emplate
exmap inserttemplate obcommand templater-obsidian:insert-templater
nnoremap <Space>it :inserttemplate<CR>

" [u]rl (e.g. a markdown link)
exmap insertlink obcommand editor:insert-link
nnoremap <Space>iu :insertlink<CR>i

" code block (for de[v])
exmap insertcodeblock obcommand editor:insert-codeblock
nnoremap <Space>iv :insertcodeblock<CR>i


" ——————————————————————————————————————————————————————————————————————————————
" (EDITION)
" misc shortcuts, that (usually) don't interfer
" with other leader-based shortcuts

" [d]elete [n]ote
exmap deletenote obcommand app:delete-file
nnoremap <Space>dn :deletenote<CR>

" [l]int  [n]ote
exmap lintnote obcommand obsidian-linter:lint-file
nnoremap <Space>ln :lintnote<CR>
nnoremap <Space>ll :lintnote<CR>

" [m]ove [n]ote
exmap movenote obcommand file-explorer:move-file
nnoremap <Space>mn :movenote<CR>
nnoremap <Space>mm :movenote<CR>

" [p]in [n]ote
" NOTE: this one is kinda annoying with the ergo-l layout,
" but no real alternative that could be easy to remember and map
" as it creates a SFB on the left index in any case,
exmap pinnote obcommand workspace:toggle-pin
nnoremap <Space>pn :pinnote<CR>
nnoremap <Space>pp :pinnote<CR>

" [r]ename [n]ote
exmap renamenote obcommand workspace:edit-file-title
nnoremap <Space>rn :renamenote<CR>
nnoremap <Space>rr :renamenote<CR>

" [r]eplace [t]emplates
exmap replacetemplates obcommand templater-obsidian:replace-in-file-templater
nnoremap <Space>rt :replacetemplates<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (REFACTOR)
" [r]efactor…

" TODO: check why the f… visual mode commandes don’t work
exmap refactorfirstline obcommand note-refactor-obsidian:app:extract-selection-first-line
vnoremap <Space>rf :refactorfirstline<CR>

exmap refactorcontent obcommand note-refactor-obsidian:app:extract-content-only
vnoremap <Space>rc :refactorcontent<CR>

" ——————————————————————————————————————————————————————————————————————————————
" (SEARCH)
" [s]earch…

" [c]ommand
exmap searchcommand obcommand command-palette:open
nnoremap <Space>sc :searchcommand<CR>

" [f]ile
exmap searchfile obcommand switcher:open
nnoremap <Space>sf :searchfile<CR>

" [g]lobal
exmap searchglobal obcommand global-search:open
nnoremap <Space>sg :searchglobal<CR>

" [h]otkeys for plugin…
exmap searchpluginhotkeys obcommand hotkey-helper:open-hotkeys
nnoremap <Space>sh :searchpluginhotkeys<CR>

" [n]ote
exmap searchnote obcommand switcher:open
nnoremap <Space>sn :searchnote<CR>

" [p]lugin
exmap searchplugin obcommand hotkey-helper:browse-plugins
nnoremap <Space>sp :searchplugin<CR>

" [q]uickAdd command
exmap searchquickadd obcommand quickadd:runQuickAdd
nnoremap <Space>sq :searchquickadd<CR>

" [r]ecent note
exmap searchrecent obcommand switcher:open
nnoremap <Space>sr :searchrecent<CR>

" NOTE: sf, sn and sr all does the same thing ;
" mainly to have sort of consistency across Obsidian and nvim (with telescope)
" but tbh, I mostly use sn or sr

" [v]ault
exmap searchvault obcommand app:open-vault
nnoremap <Space>sv :searchvault<CR>

" workspace [l]ayout
exmap searchworkspacelayout obcommand workspaces:save-and-load
nnoremap <Space>sl :searchworkspacelayout<CR>

" TODO: choose between options for vault/layout searching

" [,] : settings for plugin…
" the , symbol is inspired by the macos common shortcut ⌘, for settings
exmap searchpluginsettings obcommand hotkey-helper:open-settings
nnoremap <Space>s, :searchpluginsettings<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (NAVIGATION)
" [o]pen…

" [c]allouts
exmap opencallouts obcommand callout-manager:manage-callouts
nnoremap <Space>oc :opencallouts<CR>

" [f]lashcards
exmap openflashcards obcommand obsidian-spaced-repetition:srs-review-flashcards
nnoremap <Space>of :openflashcards<CR>

" [g]raph view
exmap opengraph obcommand graph:open
nnoremap <Space>og :opengraph<CR>

" [p]rojects
exmap openprojects obcommand obsidian-projects:show-projects
nnoremap <Space>op :openprojects<CR>

" [,] settings
exmap opensettings obcommand app:open-settings
nnoremap <Space>o, :opensettings<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (UI/text toggles)
" [t]oggle…

" [b]old
exmap togglebold obcommand editor:toggle-bold
nnoremap <Space>tb :togglebold<CR>
vnoremap <Space>tb :togglebold<CR>

" file [e]xplorer
exmap togglefileexplorer obcommand app:toggle-left-sidebar
nnoremap <Space>te :togglefileexplorer<CR>

" [f]ocus mode / [t]ab bar
exmap togglefocusmode obcommand obsidian-hider:toggle-tab-containers
nnoremap <Space>tf :togglefocusmode<CR>
nnoremap <Space>tt :togglefocusmode<CR>

" [i]talics
exmap toggleitalics obcommand editor:toggle-italics
nnoremap <Space>ti :toggleitalics<CR>
vnoremap <Space>ti :toggleitalics<CR>


" [r]ight sidebar
exmap togglerightsidebar obcommand app:toggle-right-sidebar
nnoremap <Space>tr :togglerightsidebar<CR>

" [s]tatus bar
exmap togglestatusbar obcommand obsidian-hider:toggle-hider-status
nnoremap <Space>ts :togglestatusbar<CR>
