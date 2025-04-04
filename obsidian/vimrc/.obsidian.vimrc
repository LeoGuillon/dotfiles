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

" in visual mode, paste over selection and selection goes to the black hole
" register
vnoremap p "_dp


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

" navigation and insertion on visual lines
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap I g0i
nnoremap A g$a

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
nnoremap <C-Right> :nexttab<CR>
nnoremap gt :nexttab<CR>

exmap previoustab obcommand workspace:previous-tab
nnoremap <C-Left> :previoustab<CR>
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

" [c]allout
exmap insertcallout obcommand editor:insert-callout
nnoremap <Space>ic :insertcallout<CR>i

" wiki lin[k]
exmap insertwikilink obcommand editor:insert-wikilink
nnoremap <Space>ik :insertwikilink<CR>i

" [m]ath block
exmap insertmathblock obcommand editor:insert-mathblock
nnoremap <Space>im :insertmathblock<CR>i

" " [t]able
" exmap inserttable obcommand editor:insert-table
" nnoremap <Space>it :inserttable<CR>i

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

" NOTE: each of these commands is matched with 3 different keyboard shortcuts:
" 1. main key doubled, for a vim-like syntax but applied to the whole file
" 2. key + n, for [n]ote
" 3. key + f, for [f]ile
" (mostly because right now, I don't know which option I'll prefer)

" TODO: clean those shortcuts

" [d]elete  file ([n]ote)
exmap deletefile obcommand app:delete-file
" nnoremap <Space>dd :deletefile<CR>
" NOTE: this shortcut can lead to unwanted file deletion
nnoremap <Space>dn :deletefile<CR>
nnoremap <Space>df :deletefile<CR>

" [l]int  file
exmap lintfile obcommand obsidian-linter:lint-file
nnoremap <Space>ll :lintfile<CR>
nnoremap <Space>ln :lintfile<CR>
nnoremap <Space>lf :lintfile<CR>

" [m]ove file
exmap movefile obcommand file-explorer:move-file
nnoremap <Space>mm :movefile<CR>
nnoremap <Space>mn :movefile<CR>
nnoremap <Space>mf :movefile<CR>

" [r]ename file
exmap renamefile obcommand workspace:edit-file-title
nnoremap <Space>rr :renamefile<CR>
nnoremap <Space>rn :renamefile<CR>
nnoremap <Space>rf :renamefile<CR>

" [r]eplace [t]emplates
exmap replacetemplates obcommand templater-obsidian:replace-in-file-templater
nnoremap <Space>rt :replacetemplates<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (REFACTOR)

" TODO: add note refactor here

" ——————————————————————————————————————————————————————————————————————————————
" (SEARCH)
" [f]ind…

" [c]ommand
exmap findcommand obcommand command-palette:open
nnoremap <Space>fc :findcommand<CR>

" [f]ile (e.g. a note)
exmap findfile obcommand switcher:open
nnoremap <Space>ff :findfile<CR>

" [g]lobal
exmap findglobal obcommand global-search:open
nnoremap <Space>fg :findglobal<CR>

" [h]otkeys for plugin…

" [p]lugin
exmap findplugin obcommand hotkey-helper:browse-plugins
nnoremap <Space>fp :findplugin<CR>

" [q]uickAdd command
exmap findquickadd obcommand quickadd:runQuickAdd
nnoremap <Space>fq :findquickadd<CR>

" [r]ecent note
exmap findrecent obcommand switcher:open
nnoremap <Space>fr :findrecent<CR>

" [s]ettings for plugin…


" [v]ault
exmap findvault obcommand app:open-vault
nnoremap <Space>fv :findvault<CR>


" [w]orkspace
exmap findworkspace obcommand workspaces:save-and-load
nnoremap <Space>fw :findworkspace<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (NAVIGATION)
" [o]pen…

" [c]allouts
exmap opencallouts obcommand callout-manager:manage-callouts
nnoremap <Space>oc :opencallouts<CR>

" [f]lashcards
exmap openflashcards obcommand obsidian-spaced-repetition:srs-review-flashcards
nnoremap <Space>of :openflashcards<CR>


" [g]raph view (in a new tab)
exmap opengraph obcommand graph:open
nnoremap <Space>og :opengraph<CR>

" [p]rojects
exmap openprojects obcommand obsidian-projects:show-projects
nnoremap <Space>op :openprojects<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (UI toggles)

" file [e]xplorer
exmap openfileexplorer obcommand file-explorer:open
nnoremap <Space>ue :openfileexplorer<CR>

" [f]ocus mode (tab bar)
exmap togglefocusmode obcommand obsidian-hider:toggle-tab-containers
nnoremap <Space>uf :togglefocusmode<CR>


" local [g]raph
exmap openlocalgraph obcommand graph:open-local
nnoremap <Space>ug :openlocalgraph<CR>

" [o]utline
exmap toggleoutline obcommand outline:open
nnoremap <Space>uo :toggleoutline<CR>


" [p]roperties (sidebar)

" [s]tatus bar
exmap togglestatusbar obcommand obsidian-hider:toggle-hider-status
nnoremap <Space>us :togglestatusbar<CR>
