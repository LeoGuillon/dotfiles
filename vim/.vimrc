"          ┌──────────────────────────────────────────────────────────┐
"          │                   LeoGuillon's .vimrc                    │
"          │      in case I have to use Vim, which could happen       │
"          └──────────────────────────────────────────────────────────┘
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
nnoremap S "_cc

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

" undo checkpoints during text writing
inoremap . .<C-g>u 
inoremap ! !<C-g>u 
inoremap ? ?<C-g>u 
inoremap ; ;<C-g>u 
inoremap : :<C-g>u 

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


" ───────────────────────────────────────────────────────────────────────────────
" (LEADER MAPPINGS)
" ───────────────────────────────────────────────────────────────────────────────

" Can’t set a leader key, so every occurence must be written by hand

" adding a , ; or . at the end of line
nnoremap <leader>, mzA,<Esc>`z
nnoremap <leader>; mzA<Space>;<Esc>`z
nnoremap <leader>. mzA.<Esc>`z

" quick toggle casing ; credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
nnoremap <leader>~ mzlblgueh~`z


