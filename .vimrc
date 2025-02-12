" (MAPPINGS) -------------------------------------

" Set space as the leader key
nnoremap <Space> <Nop>
let mapleader = " "

" yank from cursor to the end of line
nnoremap Y y$

" redo on U instead of <C-r>
nnoremap U <C-r>

" increment/decrement on +/-
nnoremap + <C-a>
nnoremap - <C-x>

" removes highlight search and clears command line by pressing escape
nnoremap <Esc> :nohl<Esc>

" new line above or below without entering insert mode
nnoremap <leader>n mzo<Esc>`z
nnoremap <leader>N mzO<Esc>`z

" quick toggle casing ; credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
nnoremap <leader>u mzlblgueh~`z

" fast vertical navigation ; credits : https://nanotipsforvim.prose.sh/vertical-navigation-%E2%80%93-without-relative-line-numbers
nnoremap <C-Up> 6k
nnoremap <C-Down> 6j
vnoremap <C-Up> 6k
vnoremap <C-Down> 6j

" ergol specific keymaps ; credits : https://ergol.org/articles/vim_pour_les_ergonautes/
" swap line navigation to account for shifted and non-shifted characters
nnoremap , ;
nnoremap ; ,
" jump history next to each other
nnoremap <C-c> <C-i>

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
