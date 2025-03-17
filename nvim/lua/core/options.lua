-- makes sure netrw plugin is disable for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- make tabs as spaces
opt.autoindent = true -- keeps the indentation on following line

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- cursor highlight
opt.cursorline = true

-- opt.colorcolumn = { 80 } -- adds a columns if we want to limit line length

-- termguicolors est nécessaire pour que les thèmes modernes fonctionnent
opt.termguicolors = true
opt.background = "dark" -- dark ou light en fonction de votre préférence
opt.signcolumn = "yes" -- affiche une colonne en plus à gauche pour afficher les signes (évite de décaler le texte)

-- retour
opt.backspace = "indent,eol,start"

opt.clipboard = "unnamedplus" -- use of the system clipboard

-- window split directions
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false

opt.iskeyword:append("-") -- the "-" character makes a unique word

opt.list = false -- masks invisible characters

opt.scrolloff = 999 -- makes the cursor always centered

opt.wrap = false -- disable word wrap

opt.spelllang = { "en", "fr" }

opt.showmode = false

-- (INVISIBLE CHARS)

opt.conceallevel = 2

-- filetype override for treesitter and LSPs

-- make zsh files recognized as sh for bash-ls & treesitter
vim.filetype.add({
  extension = {
    zsh = "sh",
    sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
  },
  filename = {
    [".zshenv"] = "sh",
    [".zprofile"] = "sh",
    [".zshrc"] = "sh",
  },
})

-- make Rmd files recognized as md files for treesitter & marksman
vim.filetype.add({
  extension = {
    rmd = "markdown",
    Rmd = "markdown",
  },
})

-- make plaintex as tex for treesitter & texlab
vim.filetype.add({
  extension = {
    plaintex = "tex",
    sty = "tex",
  },
})
