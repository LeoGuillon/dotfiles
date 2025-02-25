" (MAPPINGS) -------------------------------------

" yank from cursor to the end of line
nnoremap Y y$

" redo on U instead of <C-r>
nnoremap U <C-r>

" increment/decrement on +/-
nnoremap + <C-a>
nnoremap - <C-x>

" ───────────────────────────────────────────────────────────────────────────────
" (NAVIGATION)
" ───────────────────────────────────────────────────────────────────────────────

" navigation on visual lines
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

" ergol specific keymaps ; credits : https://ergol.org/articles/vim_pour_les_ergonautes/
" swap line navigation to account for shifted and non-shifted characters
nnoremap , ;
nnoremap ; ,
" jump history next to each other
nnoremap <C-c> <C-i>

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

" ───────────────────────────────────────────────────────────────────────────────
" (FILE AND TAB NAVIGATION)
" ───────────────────────────────────────────────────────────────────────────────

" Close window
exmap closeWindow obcommand workspace:close-window
nnoremap ZZ :closeWindow<CR>

" ───────────────────────────────────────────────────────────────────────────────
" (LEADER MAPPINGS)
" ───────────────────────────────────────────────────────────────────────────────

" Can’t set a leader key, so every occurence must be written by hand
nnoremap <Space> <Nop>

" removes highlight search
nnoremap <Space>nh :nohl<Esc>

" new line above or below without entering insert mode
nnoremap <Space>n mzo<Esc>`z
nnoremap <Space>N mzO<Esc>`z

" adding a , ; or . at the end of line
nnoremap <Space>, mzA,<Esc>`z
nnoremap <Space>; mzA;<Esc>`z
nnoremap <Space>. mzA.<Esc>`z

" quick toggle casing ; credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
nnoremap <Space>u mzlblgueh~`z
