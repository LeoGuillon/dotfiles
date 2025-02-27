" ==============================================================================
" (VIM-RELATED SETTINGS)
" ==============================================================================

" line numbers
set relativenumber

" cursor line highlight
set cursorline

" ==============================================================================
" (MAPPINGS)
" ==============================================================================

" ——————————————————————————————————————————————————————————————————————————————
" (CONVENIANCE MAPPINGS)
" ——————————————————————————————————————————————————————————————————————————————


" Esc cleans the command line and highlights
" source : https://nanotipsforvim.prose.sh/esc-in-normal-mode
" nnoremap <Esc> :nohl<CR>:echo<CR>

" ——————————————————————————————————————————————————————————————————————————————
" (YANKING AND PASTING)

" move the delete and change operators to the black hole register
" credits : https://nanotipsforvim.prose.sh/keeping-your-register-clean-from-dd
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C

" yank from cursor to the end of line
nnoremap Y y$

" paste at the end of line
nnoremap P mz$p`z

" redo on U instead of <C-r>
nnoremap U <C-r>

" togglecase command doesn't move forward a character
nnoremap ~ v~

" ——————————————————————————————————————————————————————————————————————————————
" (ERGO-L LAYOUT SPECIFIC KEYMAPS)
" credits : https://ergol.org/articles/vim_pour_les_ergonautes/

" swap line navigation to account for shifted and non-shifted characters
nnoremap , ;
nnoremap ; ,

" jump history next to each other
nnoremap <C-c> <C-i>

" increment/decrement on +/-
nnoremap + <C-a>
nnoremap - <C-x>

" find previous on \
" due to the symmetry between \ and / on symbol layer
nnoremap \ ?

" make the command mode a bit more accessible
nnoremap ' :

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
" (NAVIGATION)
" ——————————————————————————————————————————————————————————————————————————————

" window management using a syntax similar to tmux
" nnoremap <C-a> <C-w>
nnoremap <C-w>- <C-w>s
nnoremap <C-w><Bar> <C-w>v

" fast vertical navigation  
" credits : https://nanotipsforvim.prose.sh/vertical-navigation-%E2%80%93-without-relative-line-numbers
nnoremap <S-Left> ^
nnoremap <S-Down> 6j
nnoremap <S-Up> 6k
nnoremap <S-Right> $

vnoremap <S-Left> ^
vnoremap <S-Down> 6j
vnoremap <S-Up> 6k
vnoremap <S-Right> $

inoremap <S-Left> ^
inoremap <S-Down> 6j
inoremap <S-Up> 6k
inoremap <S-Right> $

" pane switching
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

" going to next/previous search results centers the screen
nnoremap n nzz
nnoremap N Nzz

" ——————————————————————————————————————————————————————————————————————————————
" (TEXT OBJECTS)
" ——————————————————————————————————————————————————————————————————————————————

" credits : https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed
" reminder : already existing text objects
" [l]etter (e.g. character)
" [w]ord
" [s]entence
" [p]aragraph
" [t]ag
" [b]rackets

" [m]assive word
onoremap im iW
onoremap am aW
vnoremap im iW
vnoremap am aW

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

" ------------------------------------------------------------------------------
" (LEADER MAPPINGS)
" ------------------------------------------------------------------------------

" Set space as the leader key
nnoremap <Space> <Nop>
let mapleader = " "

" removes highlight search
nnoremap <leader>nh :nohl<Esc>

" new line above or below without entering insert mode
nnoremap <leader>n mzo<Esc>`z
nnoremap <leader>N mzO<Esc>`z

" common typos while programming : adding a symbol at the end of line
nnoremap <leader>, mzA,<Esc>`z
nnoremap <leader>; mzA;<Esc>`z
nnoremap <leader>. mzA.<Esc>`z

" quick toggle casing ; credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
nnoremap <leader>u mzlblgueh~`z
