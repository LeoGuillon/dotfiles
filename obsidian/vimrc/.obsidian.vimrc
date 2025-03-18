" ——————————————————————————————————————————————————————————————————————————————
" (CONVENIANCE MAPPINGS)
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

" redo on U instead of <C-r>
nnoremap U <C-r>

" togglecase command doesn't move forward a character
nnoremap ~ v~

" ——————————————————————————————————————————————————————————————————————————————
" (LINES)

" new line above or below without entering insert mode
nnoremap gn mzo<Esc>`z
nnoremap gN mzO<Esc>`z

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

" [g]o to [m]atching parenthesis
nnoremap gm %
vnoremap gm %
onoremap gm %

" ───────────────────────────────────────────────────────────────────────────────
" (INTER-FILE NAVIGATION)

exmap nexttab obcommand workspace:next-tab
nnoremap <C-Right> :nexttab<CR>
nnoremap gt :nexttab<CR>

exmap previoustab obcommand workspace:previous-tab
nnoremap <C-Left> :previoustab<CR>
nnoremap gT :previoustab<CR>

" [g]o to wiki lin[k] under cursor
" to match with usual shortcut, even though 'gf' still works
nnoremap gk gf

" close tab
exmap closetab obcommand workspace:close
nnoremap ZZ :closetab<CR>

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

" " [m]assive word
" onoremap im iW
" onoremap am aW
" vnoremap im iW
" vnoremap am aW

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


" ——————————————————————————————————————————————————————————————————————————————
" (SURROUND)
" ——————————————————————————————————————————————————————————————————————————————

" source : https://github.com/esm7/obsidian-vimrc-support
exmap surround_brackets surround ( )
exmap surround_curly_brackets surround { }
exmap surround_rectangular_brackets surround [ ]
exmap surround_quotes surround " "
exmap surround_apostrophe_quotes surround ' '
exmap surround_inline_code surround ` `
exmap surround_wiki_link surround [[ ]]
exmap surround_math surround $ $

nunmap S
vunmap S

map Sb :surround_brackets<CR>
map Sc :surround_curly_brackets<CR>
map Sr :surround_rectangular_brackets<CR>
map Sq :surround_quotes<CR>
map Sa :surround_apostrophe_quotes<CR>
map Si :surround_inline_code<CR>
map Sk :surround_wiki_link<CR>
map Sm :surround_math<CR>


" ───────────────────────────────────────────────────────────────────────────────
" (LEADER MAPPINGS)
" ───────────────────────────────────────────────────────────────────────────────

" Can’t set a leader key, so every occurence must be written by hand
unmap <Space>

" adding a , ; or . at the end of line
nnoremap <Space>, mzA,<Esc>`z
nnoremap <Space>; mzA<Space>;<Esc>`z " we add a space here because we're not writing code but regular text
nnoremap <Space>. mzA.<Esc>`z

" quick toggle casing ; credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
nnoremap <Space>~ mzlblgueh~`z


" ——————————————————————————————————————————————————————————————————————————————
" (NOTE CREATION)
" [n]ew…

" [b]ook

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
" [y]outube video note

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
" [e]dit…

" replace [t]emplates
exmap replacetemplates obcommand templater-obsidian:replace-in-file-templater
nnoremap <Space>et :replacetemplates<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (REFACTOR)
" [r]efactor…

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

" [p]lugin
exmap findplugin obcommand hotkey-helper:browse-plugins
nnoremap <Space>fp :findplugin<CR> 

" [q]uickAdd command
exmap findquickadd obcommand quickadd:runQuickAdd
nnoremap <Space>fq :findquickadd<CR> 

" [r]ecent note
exmap findrecent obcommand switcher:open
nnoremap <Space>fr :findrecent<CR>

" [w]orkspace
exmap findworkspace obcommand workspaces:save-and-load
nnoremap <Space>fw :findworkspace<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (NAVIGATION)
" [o]pen…

" [c]allouts
exmap opencallouts obcommand callout-manager:manage-callouts
nnoremap <Space>oc :opencallouts<CR>

" [g]raph view (in a new tab)
exmap opengraph obcommand graph:open
nnoremap <Space>og :opengraph<CR>

" [p]rojects
exmap openprojects obcommand obsidian-projects:show-projects
nnoremap <Space>op :openprojects<CR>


" ——————————————————————————————————————————————————————————————————————————————
" (UI toggles)

" refactor mode 
" focus mode (tab bar)
" file [e]xplorer
exmap openfileexplorer obcommand file-explorer:open
nnoremap <Space>ue :openfileexplorer<CR>

" local [g]raph
exmap openlocalgraph obcommand graph:open-local
nnoremap <Space>ug :openlocalgraph<CR>

" properties (sidebar)
" properties (toggle fold)
" [s]tatus bar
exmap togglestatusbar obcommand obsidian-hider:toggle-hider-status
nnoremap <Space>us :togglestatusbar<CR>
