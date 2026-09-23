-- ──────────────────────────────────────────────────────────────────────────────
-- BUILT-IN PLUGINS
-- ──────────────────────────────────────────────────────────────────────────────

-- makes sure netrw plugin is disable for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.editorconfig = false

-- ──────────────────────────────────────────────────────────────────────────────
-- OPTIONS
-- ──────────────────────────────────────────────────────────────────────────────

local options = {

	-- line numbers
	relativenumber = false,
	number = false,
	-- NOTE: why ? mostly because I realized I mostly use shift + up/down
	--  to move faster, and don’t rely that much on number before moves
	--  or operations, as I rely more on textobjects.
	--  Therefore, I remove line numbers tidy up the interface
	--  I can still rely on it in the bottom right corner,
	--  or can toggle them back with <leader>tn

	-- tabs and indentation
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true, -- make tabs as spaces,
	autoindent = true, -- keeps the indentation on following line,

	-- search
	ignorecase = true,
	smartcase = true,
	hlsearch = true,

	-- cursor highlight
	cursorline = true,

	colorcolumn = {}, -- adds a columns if we want to limit line length,

	-- inccommand = "split",
	-- not bad, but I mostly replace in visual selection,
	-- can become handy if starting to doing more file- or project-wise modifications

	-- termguicolors is mandatory so that modern thems work well
	termguicolors = true,
	background = "dark",
	signcolumn = "yes", -- supplementary column for gitsigns and stuff

	-- backspace
	backspace = "indent,eol,start",

	-- clipboard
	clipboard = "unnamedplus", -- use of the system clipboard

	-- window split directions
	splitright = true,
	splitbelow = true,

	swapfile = false,

	list = false, -- masks invisible characters

	scrolloff = 999, -- makes the cursor always centered

	wrap = false, -- disable word wrap

	spelllang = { "en", "fr" },

	showmode = false,

	undofile = true, -- persistent undo across sessions

	fcs = "eob: ", -- hide ~ characters at eof
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- ──────────────────────────────────────────────────────────────────────────────
-- FILETYPE OVERRIDE FOR TREESITTER AND LSPS
-- ──────────────────────────────────────────────────────────────────────────────

-- TODO: move theses into ftdetect or after/ftdetect

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
		["sketchybarrc"] = "sh",
	},
})
