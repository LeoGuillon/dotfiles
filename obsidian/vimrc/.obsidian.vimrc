" ——————————————————————————————————————————————————————————————————————————————
" (CONVENIANCE MAPPINGS)
" ——————————————————————————————————————————————————————————————————————————————

" Esc cleans the command line and highlights
" source : https://nanotipsforvim.prose.sh/esc-in-normal-mode
" nnoremap <Esc> :nohl<CR>:echo<CR>

" ——————————————————————————————————————————————————————————————————————————————
" (YANKING AND PASTING)

" move the delete and change to the black hole register
" credits : https://nanotipsforvim.prose.sh/keeping-your-register-clean-from-dd
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C

" yank from cursor to the end of line
nnoremap Y y$

" yank to system clipboard
set clipboard=unnamed

" paste at the end of line
" instead of behind the cursor, for more coherence with other commands
nnoremap P mzg$p`z

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

" personal improvement : find previous on \
" due to the symmetry between \ and / on symbol layer
nnoremap \ ?

" increment/decrement on +/-
nnoremap + <C-a>
nnoremap - <C-x>

" ——————————————————————————————————————————————————————————————————————————————
" (VISUAL MODE)

" double v to enter visual block mode
vnoremap v <C-v>

" enter V multiple times to select multiple lines
vnoremap V gj

" indenting in visual mode keeps the selection on
vnoremap > >gv
vnoremap < <gv

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

" going to next/previous search results centers the screen
nnoremap n nzz
nnoremap N Nzz

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

" ───────────────────────────────────────────────────────────────────────────────
" (FILE AND TAB NAVIGATION)
" ───────────────────────────────────────────────────────────────────────────────

" to complete...
" source : https://github.com/chrisgrieser/.config/blob/main/obsidian/vimrc/obsidian-vimrc.vim

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
nnoremap <Space>; mzA<Space>;<Esc>`z " we add a space here because we're not writing code but regular text
nnoremap <Space>. mzA.<Esc>`z

" quick toggle casing ; credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
nnoremap <Space>u mzlblgueh~`z


" ——————————————————————————————————————————————————————————————————————————————
" (FILE EDITION)

" rename
exmap rename obcommand workspace:edit-file-title
nnoremap <Space>fr :rename<CR>

" delete
exmap rename obcommand app:delete-file
nnoremap <Space>fd :delete<CR>
