-- ────────────────────────────────────────────────────────────────────────────────
-- OPTIONS
-- ────────────────────────────────────────────────────────────────────────────────

vim.opt_local.wrap = true -- enable wrap lines for tex files
vim.opt_local.linebreak = true -- wrap on words instead of characters

-- hides line numbers by default
vim.opt_local.relativenumber = false
vim.opt_local.number = false

-- comment.nvim for .tex files
vim.bo.commentstring = "% %s"

-- ────────────────────────────────────────────────────────────────────────────────
-- KEYMAPS
-- ────────────────────────────────────────────────────────────────────────────────

local map = require("core.utils").map

-- ────────────────────────────────────────────────────────────────────────────────
-- typographic commodities

-- overrides the trailing characters commands

-- fine insecable space
map("n", "<leader>;", "mzA\\,;<Esc>`z", { desc = "add ; to eol" })
map("n", "<leader>!", "mzA\\,!<Esc>`z", { desc = "add ! to eol" })
map("n", "<leader>?", "mzA\\,?<Esc>`z", { desc = "add ? to eol" })

-- insecable
map("n", "<leader>:", "mzA~:<Esc>`z", { desc = "add : to eol" })
map("n", "<leader>\\", "<plug>vimtex-cmd-toggle-break", { desc = "add line break to eol" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (TEXT OBJECTS)
-- ────────────────────────────────────────────────────────────────────────────────

local custom_latex_text_objects = {
	{ "d", "d", "Delimiters" },
	{ "e", "e", "Environment" },
	{ "i", "m", "Item" }, -- override [i]nline code, as backticks are quit rare in LaTeX
	{ "l", "c", "LaTeX command" },
	{ "m", "$", "Math block" },
	{ "x", "P", "sect(X)ion" },
}

for _, value in pairs(custom_latex_text_objects) do
	local remap, original, label = unpack(value)
	map({ "x", "o" }, "i" .. remap, "<plug>(vimtex-i" .. original .. ")", { desc = label })
	map({ "x", "o" }, "a" .. remap, "<plug>(vimtex-a" .. original .. ")", { desc = label })
end

-- ────────────────────────────────────────────────────────────────────────────────
-- (SURROUND COMMANDS)
-- ────────────────────────────────────────────────────────────────────────────────
-- just to make sure all the commands don't interfer with the rest of nvim's commands
-- because all default mappings are disabled, have to write them entirely,
-- to make sure there’s no unwanted overlaps

-- ──────────────────────────────────────────────────────────────────────────────
-- (VIMTEX SPECIFIC COMMANDS)

-- [d]elimiters
map("n", "dsd", "<plug>(vimtex-delim-delete)", { desc = "Delete Surrounding Delimiters" })
map("n", "csd", "<plug>(vimtex-delim-change)", { desc = "Change Surrounding Delimiters" })

-- [e]nvironment
map("n", "dse", "<plug>(vimtex-env-delete)", { desc = "Delete Surrounding Environment" })
map("n", "cse", "<plug>(vimtex-env-change)", { desc = "Change Surrounding Environment" })
map("x", "Se", "<plug>(vimtex-env-surround-visual)", { desc = "Surround selection with Environment" })

-- [l]aTeX command
map("n", "dsl", "<plug>(vimtex-cmd-delete)", { desc = "Delete Surrounding LaTeX command" })
map("n", "csl", "<plug>(vimtex-cmd-change)", { desc = "Change Surrounding LaTeX command" })
map("x", "Sl", "<plug>(vimtex-cmd-create)", { desc = "Surround selection with LaTeX command" })

-- [m]ath block
map("n", "dsm", "<plug>(vimtex-env-delete-math)", { desc = "Delete Surrounding Math environnement" })
map("n", "csm", "<plug>(vimtex-env-change-math)", { desc = "Change Surrounding Math environnement" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (SURROUND CUSTOM TEXT OBJECTS)
-- This is needed to have ys… commands for LaTeX specific text objects.
-- Note that it isn’t needed for delimiters, as I can use regular nvim-surround’s
-- text objects.
-- Also, can handle text formatting as surrounding

require("nvim-surround").buffer_setup({
	surrounds = {
		-- ys… for vimtex text objets
		["e"] = {
			add = function()
				local env = vim.fn.input("Environment: ")
				return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
			end,
		},
		["l"] = {
			add = function()
				local command = vim.fn.input("LaTeX command:")
				return { { "\\" .. command .. "{" }, { "}" } }
			end,
		},
		["m"] = {
			add = { "\\(", "\\)" },
		},
		-- surrounds for [t]ext formatting
		-- TODO: override the HTML [t]ag
		-- ["tb"] = { -- [b]old
		-- 	add = { { "\\textbf{" }, { "}" } },
		-- 	find = "\\%a-bf%b{}",
		-- 	delete = "^(\\%a-bf{)().-(})()$",
		-- },
		-- ["te"] = { -- [e]mphasis
		-- 	add = { { "\\emph{" }, { "}" } },
		-- 	find = "\\emph%b{}",
		-- 	delete = "^(\\emph{)().-(})()$",
		-- },
		-- ["ti"] = { -- [i]talic
		-- 	add = { "\\textit{", "}" },
		-- 	find = "\\%a-it%b{}",
		-- 	delete = "^(\\%a-it{)().-(})()$",
		-- },
		-- ["tt"] = { -- [t]ypewriter
		-- 	add = { "\\texttt{", "}" },
		-- 	find = "\\%a-tt%b{}",
		-- 	delete = "^(\\%a-tt{)().-(})()$",
		-- },
	},
})

-- ──────────────────────────────────────────────────────────────────────────────
-- (TOGGLES)

require("which-key").add({ { "<leader>ts", group = "Surrounding…", icon = "" } })

-- line [b]reak
map("n", "<leader>tb", "<plug>(vimtex-cmd-toggle-break)", { desc = "line Break" })

-- [d]elimiters
map("n", "<leader>tsd", "<plug>(vimtex-delim-toggle-modifier)", { desc = "Delimiters" })

-- [e]nvironment
map("n", "<leader>tse", "<plug>(vimtex-env-toggle)", { desc = "Environment" })

-- [f]raction
map("n", "<leader>tsf", "<plug>(vimtex-cmd-toggle-frac)", { desc = "Fraction mode" })

-- [m]ath delimiters
map("n", "<leader>tsm", "<plug>(vimtex-env-toggle-math)", { desc = "Math delimiters" })

-- [s]tarred environment
map("n", "<leader>tss", "<plug>(vimtex-cmd-toggle-star-agn)", { desc = "Starred environment or LaTeX command" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (NAVIGATION)
-- ────────────────────────────────────────────────────────────────────────────────

-- between beginning/end of sections, subsections or subsubsections : [[ / ]], same logic than with markdown
map({ "n", "x", "o" }, "]]", "<plug>(vimtex-]])", { desc = "section beginning" })
map({ "n", "x", "o" }, "[[", "<plug>(vimtex-[[)", { desc = "section beginning" })
map({ "n", "x", "o" }, "][", "<plug>(vimtex-][)", { desc = "section end" })
map({ "n", "x", "o" }, "[]", "<plug>(vimtex-[])", { desc = "section end" })

-- between beginning/end of [e]nvironnements :
map({ "n", "x", "o" }, "]e", "<plug>(vimtex-]m)", { desc = "[e]nv. \\begin{}" })
map({ "n", "x", "o" }, "[e", "<plug>(vimtex-[m)", { desc = "[e]nv. \\begin{}" })
map({ "n", "x", "o" }, "]E", "<plug>(vimtex-]M)", { desc = "[e]nv. \\end{}" })
map({ "n", "x", "o" }, "[E", "<plug>(vimtex-[M)", { desc = "[e]nv. \\end{}" })

-- between beginning/end of [m]ath environnements :
map({ "n", "x", "o" }, "]m", "<plug>(vimtex-]n)", { desc = "[m]ath block" })
map({ "n", "x", "o" }, "[m", "<plug>(vimtex-[n)", { desc = "[m]ath block" })
map({ "n", "x", "o" }, "]M", "<plug>(vimtex-]N)", { desc = "[m]ath block" })
map({ "n", "x", "o" }, "[M", "<plug>(vimtex-[N)", { desc = "[m]ath block" })

-- between beginning/end of beamer [f]rames
map({ "n", "x", "o" }, "]f", "<plug>(vimtex-]r)", { desc = "[f]rame" })
map({ "n", "x", "o" }, "[f", "<plug>(vimtex-[r)", { desc = "[f]rame" })
map({ "n", "x", "o" }, "]F", "<plug>(vimtex-]R)", { desc = "[f]rame end" })
map({ "n", "x", "o" }, "[F", "<plug>(vimtex-[R)", { desc = "[f]rame end" })

-- go to matching pair, adapted to LaTeX delimiters
map({ "n", "v" }, "%", "<plug>(vimtex-%)", { desc = "Go to matching delimiter" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (LOCALLEADER COMMANDS)
-- ────────────────────────────────────────────────────────────────────────────────

require("which-key").add({ { "<localleader>c", group = "[c]ount…" } })

map("n", "<localleader>b", "<plug>(vimtex-compile)", { desc = "[b]uild project (continuous)" })
map("n", "<localleader>B", "<cmd>wa<cr><cmd>VimtexCompileSS<cr>", { desc = "[b]uild project (single-shot)" })
map("n", "<localleader>cl", "<cmd>VimtexCountLetters<cr>", { desc = "[l]etters in project" })
map("n", "<localleader>cL", "<cmd>VimtexCountLetters!<cr>", { desc = "[l]etters for each file" })
map("n", "<localleader>cw", "<cmd>VimtexCountWords<cr>", { desc = "[w]ords in project" })
map("n", "<localleader>cW", "<cmd>VimtexCountWords!<cr>", { desc = "[w]ords for each file" })
map("n", "<localleader>d", "<plug>(vimtex-doc-package)", { desc = "open package [d]ocumentation" })
map("n", "<localleader>p", "<plug>(vimtex-view)", { desc = "view [P]DF output" })
map("n", "<localleader>s", "<plug>(vimtex-toc-toggle)", { desc = "toggle table of contents ([s]ommaire)" })
map("n", "<localleader>x", "<plug>(vimtex-clean)", { desc = "clean aux files" })
map("n", "<localleader>X", "<plug>(vimtex-clean-full)", { desc = "clean aux and output files" })
-- map("n", "<localleader>x", "<plug>(vimtex-errors)", { desc = "open errors" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (TEMPLATES)
-- ──────────────────────────────────────────────────────────────────────────────

local templates = {
	{ "a", "default", "[a]rticle" },
	{ "b", "math/presentation", "[b]eamer" },
	{ "d", "math/devoir", "[d]evoir" },
	{ "e", "math/exercices", "feuille d’[e]xercices" },
	{ "l", "lettre", "[l]ettre" },
	{ "s", "math/support-de-cours", "[s]upport de cours" },
}

local templates_location = "~/.config/nvim/templates/tex/"

-- NOTE: a bit tedious, but done that way in order to mimic my obsdian keymap
require("which-key").add({ { "<leader>i", group = "[i]nsert…", icon = "" } })
require("which-key").add({ { "<leader>it", group = "[t]emplates…", icon = "" } })

for _, value in pairs(templates) do
	local key, filetitle, label = unpack(value)
	map("n", "<leader>it" .. key, "<cmd>read " .. templates_location .. filetitle .. ".tex<cr>", { desc = label })
end

-- ────────────────────────────────────────────────────────────────────────────────
-- (COMPLETION SETUP)
-- ────────────────────────────────────────────────────────────────────────────────

local cmp = require("cmp")
cmp.setup.buffer({
	sources = {
		{ name = "luasnip" },
		{ name = "vimtex" },
		{ name = "nvim_lsp" },
		{ name = "latex_symbols", option = { strategy = 2 } }, -- latex symbols, insert the command
		{ name = "path" },
		-- { name = "buffer" },
	},
})
