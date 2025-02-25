" ——————————————————————————————————————————————————————————————————————————————
" (CONVENIANCE MAPPINGS)

" make the command mode a bit more accessible
nnoremap ' :

" move the delete and change to the black hole register
" credits : https://nanotipsforvim.prose.sh/keeping-your-register-clean-from-dd
nnoremap x _x
nnoremap c _c

" yank from cursor to the end of line
nnoremap Y y$

" paste at the end of line
" instead of behind the cursor, for more coherence with other commands
nnoremap P mz$p`z

" redo on U instead of <C-r>
nnoremap U <C-r>

" increment/decrement on +/-
nnoremap + <C-a>
nnoremap - <C-x>

" ergo-l layout specific keymaps ; credits : https://ergol.org/articles/vim_pour_les_ergonautes/
" swap line navigation to account for shifted and non-shifted characters
nnoremap , ;
nnoremap ; ,
" jump history next to each other
nnoremap <C-c> <C-i>


" ——————————————————————————————————————————————————————————————————————————————
" (COMMENTS)

" appends a comment at the end of line
nnoremap gcA mzo<Esc>gcc`zJA "

" appends a line comment above or below
nnoremap gco o<Esc>gccA
nnoremap gcO O<Esc>gccA


" ——————————————————————————————————————————————————————————————————————————————
" (NAVIGATION)

" window management using the same prefix as tmux
nnoremap <C-a> <C-w>
nnoremap <C-a>- <C-w>s
nnoremap <C-a>| <C-w>v
" nnoremap <C-a><Bar> <C-w>v " vim correct syntax

" fast vertical navigation ; credits : https://nanotipsforvim.prose.sh/vertical-navigation-%E2%80%93-without-relative-line-numbers
" nnoremap <C-Left> ^
nnoremap <C-Down> 6j
nnoremap <C-Up> 6k
" nnoremap <C-Right> $

" vnoremap <C-Left> ^
vnoremap <C-Down> 6j
vnoremap <C-Up> 6k
" vnoremap <C-Right> $

" correct intendet binding for fast navigation with shift, not available yet in VSCode
" nnoremap <S-Left> ^
" nnoremap <S-Down> 6j
" nnoremap <S-Up> 6k
" nnoremap <S-Right> $

" vnoremap <S-Left> ^
" vnoremap <S-Down> 6j
" vnoremap <S-Up> 6k
" vnoremap <S-Right> $

" pane switching : correct mapping, but no correct yet in VS Code, due to issues with shift+direction
nnoremap <C-Left> <C-w>h
" nnoremap <C-Down> <C-w>j
" nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

" ——————————————————————————————————————————————————————————————————————————————
" (TEXT OBJECTS)

" remapped text objects ; credits : https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed
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

" [n]ew line above or below without entering insert mode
nnoremap <leader>n mzo<Esc>`z
nnoremap <leader>N jmzkO<Esc>`z

" common typos while programming : adding a symbol at the end of line
nnoremap <leader>, mzA,<Esc>`z
nnoremap <leader>; mzA;<Esc>`z
nnoremap <leader>. mzA.<Esc>`z

" quick toggle casing ; credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
nnoremap <leader>u mzlblgueh~`z
