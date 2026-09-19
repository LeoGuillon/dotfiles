-- ──────────────────────────────────────────────────────────────────────────────
-- (PARAMETERS)
-- ──────────────────────────────────────────────────────────────────────────────

-- TODO: better organization of the parameters

-- ──────────────────────────────────────────────────────────────────────────────
-- (CURSOR SHAPES)

vim.obsidian.cursor.set({
	normal = "block",
	insert = "bar",
	visual = "block",
	replace = "underline",
	operator_pending = "underline",
})

-- ──────────────────────────────────────────────────────────────────────────────
-- (WHICH-KEY)

vim.opt.whichkey = "all"
vim.opt.whichkeydelay = 1000
vim.opt.whichkeygrouping = "grouped"
vim.opt.whichkeysortorder = "groups-first"
vim.opt.whichkeyicons = true

-- ──────────────────────────────────────────────────────────────────────────────
-- (OPTIONS)

vim.opt.hardwrap = false
vim.opt.statusbar = false

vim.opt.scrolloff = 999

vim.opt.clipboard = "unnamedplus"

-- -- yank highlight
vim.opt.yankhighlightmode = "solid"
vim.opt.yankhighlightduration = 400

vim.opt.dial = true

vim.opt.workspacenav = false -- setup manually with Obsidian shortcuts and here

-- jump navigation
vim.opt.flash = false
vim.opt.easymotion = false
vim.opt.easymotiondimming = false
vim.opt.hintmode = false
vim.opt.harpoon = false

-- snippets
-- BUG: snippets doesn’t work ?
vim.opt.snippets = false
-- vim.opt.snippetbundled = true
-- vim.opt.snippettrigger = "both"
-- vim.opt.snippetdir = "…"

-- file explorer
vim.opt.oilexplorer = false

-- undotree
-- TODO: setup undotree
vim.opt.undotree = false

-- status bar
vim.opt.statusbar = false

-- ──────────────────────────────────────────────────────────────────────────────
-- (TABLE)

vim.opt.tablenav = false

-- ──────────────────────────────────────────────────────────────────────────────
-- (LEADER KEY)
-- ──────────────────────────────────────────────────────────────────────────────

vim.g.mapleader = " "

vim.keymap.del("n", "<CR>")

-- ──────────────────────────────────────────────────────────────────────────────
-- (BETTER ESCAPE)
-- ──────────────────────────────────────────────────────────────────────────────
-- credits : https://nanotipsforvim.prose.sh/esc-in-normal-mode

vim.keymap.set("n", "<esc>", "<cmd>nohl<cr><cmd>echo<CR>", { desc = "escape and clear hlsearch and command line" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (NAVIGATION)
-- ──────────────────────────────────────────────────────────────────────────────

-- ────────────────────────────────────────────────────────────────────────────────
-- (INTRA-PANE)

-- navigation on visual lines
vim.keymap.set("n", "<Down>", "gj", { desc = "Down" })
vim.keymap.set("n", "<Up>", "gk", { desc = "Up" })

-- Faster navigation
-- credits : https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl
vim.keymap.set({ "n", "v" }, "<S-Left>", "0^", { desc = "Go to first non-blank character" })
vim.keymap.set("n", "<S-Down>", "6gj", { desc = "Move down 6 lines" })
vim.keymap.set("v", "<S-Down>", "6j", { desc = "Move down 6 lines" })
vim.keymap.set("n", "<S-Up>", "6gk", { desc = "Move down 6 lines" })
vim.keymap.set("v", "<S-Up>", "6k", { desc = "Move down 6 lines" })
vim.keymap.set({ "n", "v" }, "<S-Right>", "g$", { desc = "Go to end of line" })

-- pages up/down keeps the cursor centered
vim.keymap.set({ "n", "v" }, "<PageDown>", "<c-d>zz", { desc = "half-page Down" })
vim.keymap.set({ "n", "v" }, "<PageUp>", "<c-u>zz", { desc = "half-page Up" })
vim.keymap.set({ "n", "v" }, "<S-PageDown>", "<c-f>zz", { desc = "page down (Forwards)" })
vim.keymap.set({ "n", "v" }, "<S-PageUp>", "<c-b>zz", { desc = "page up (Backwards)" })

-- next and previous occurences by maintaining the cursor centered
vim.keymap.set("n", "n", "nzzzv", { desc = "Next occurence of search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous occurence of search" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (INTER-PANE)

vim.keymap.set("n", "<BS>", function()
	vim.cmd("ob app:go-back")
end, { desc = "go back" })
vim.keymap.set("n", "<C-BS>", function()
	vim.cmd("ob app:go-forward")
end, { desc = "go forward" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (STRUCTURAL NAVIGATION)
-- mostly a memo for what is available in Vim Motions plugin

-- [b]uffer
-- [h]eading
-- [1—6] heading of corresponding level
-- [l]ist item
-- li[n]k

-- wiki lin[k]
vim.keymap.set("n", "[k", ":prevlink<CR>", { desc = "lin[k]" })
vim.keymap.set("n", "]k", ":nextlink<CR>", { desc = "lin[k]" })

vim.keymap.del("n", "]n")
vim.keymap.del("n", "[n")

-- ──────────────────────────────────────────────────────────────────────────────
-- (WORKSPACE NAVIGATION)

vim.keymap.set("n", "gn", function()
	vim.cmd("ob editor:open-link-in-new-leaf")
end, { desc = "[g]o to [n]ote" })
vim.keymap.set("n", "gf", function()
	vim.cmd("ob editor:open-link-in-new-leaf")
end, { desc = "[g]o to [f]ile" })
vim.keymap.set("n", "gN", function()
	vim.cmd("ob editor:open-link-in-new-split")
end, { desc = "[g]o to [n]ote in a new split" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (EDITION)
-- ──────────────────────────────────────────────────────────────────────────────

-- ──────────────────────────────────────────────────────────────────────────────
-- (YANKING AND PASTING)

-- deleting and changing to the black hole register
-- credits : https://nanotipsforvim.prose.sh/keeping-your-register-clean-from-dd
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "delete under cursor" })

vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "[c]hange" })
vim.keymap.set({ "n", "v" }, "C", '"_C', { desc = "[c]hange until the end of line" })

vim.keymap.set("n", "s", '"_cl', { desc = "[s]ubstitute character" })
vim.keymap.set("n", "S", '"_cc', { desc = "[s]ubstitute line" })

-- smart delete line : black hole register if empty line deleted
vim.keymap.set("n", "dd", function()
	if vim.fn.getline(".") == "" then
		return '"_dd'
	end
	return "dd"
end, { desc = "(smart) [d]elete line" })

vim.keymap.set("v", "p", function()
	vim.cmd(":ob url-into-selection:paste-url-into-selection<CR>")
end, { desc = "[p]aste" }) -- mimic ctrl+v with url into selection plugin

-- NOTE: Y in normal mode are already supported by the plugin
vim.keymap.set("n", "P", "mzg$p`z")

-- ——————————————————————————————————————————————————————————————————————————————
-- (UNDO/REDO)

vim.keymap.set({ "n", "v" }, "U", "<C-r>", { desc = "Redo" }) -- more consistent undo keymap

-- ──────────────────────────────────────────────────────────────────────────────
-- (CASING)

vim.keymap.set("n", "~", "v~", { desc = "togglecase a single character" }) -- without moving forward

-- credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
vim.keymap.set("n", "<leader>~", "mzlblgueh~`z", { desc = "smart word togglecasing" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (TRAILING CHARS)
-- credits : https://github.com/chrisgrieser/.config/blob/9fb7bea009be951f9676ef52634a7d12d9717953/nvim/lua/config/leader-keybindings.lua

-- BUG: can’t exit insert mode
-- vim.keymap.set("n", "<leader>.", "mzA.<C-C>`z", { desc = "add . to eol" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (INDENTATION)

-- same command as in insert mode for more consistency
vim.keymap.set("n", "<Tab>", ">>", { desc = "󰉶 indent line" })
vim.keymap.set("x", "<Tab>", ">gv", { desc = "󰉶 indent line" })
vim.keymap.set("n", "<S-Tab>", "<<", { desc = "󰉵 outdent selection" })
vim.keymap.set("x", "<S-Tab>", "<gv", { desc = "󰉵 outdent selection" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (MOVING CHARACTERS)

-- TODO: setup moving characters for Obsidian

-- ──────────────────────────────────────────────────────────────────────────────
-- (ERGO-L LAYOUT SPECIFIC KEYMAPS)
-- ──────────────────────────────────────────────────────────────────────────────
-- credits : https://ergol.org/articles/vim_pour_les_ergonautes/

vim.keymap.set("n", ",", ";", { desc = "go to next occurence in line" })
vim.keymap.set("n", ";", ",", { desc = "go to previous occurence in line" })

vim.keymap.set("n", "<C-c>", "<C-i>", { desc = "jump to previous location" }) -- so that they're next to each other

-- ──────────────────────────────────────────────────────────────────────────────
-- (PERSONAL IMPROVEMENTS)

-- +/- on increment/decrement
-- BUG: bugged in visual mode
vim.keymap.set({ "n", "v" }, "+", "<C-a>", { desc = "increment" })
vim.keymap.set({ "n", "v" }, "-", "<C-x>", { desc = "decrement" })
vim.keymap.set({ "n", "v" }, "g+", "g<C-a>", { desc = "g-Increment" })
vim.keymap.set({ "n", "v" }, "g-", "g<C-x>", { desc = "g-Decrement" })

-- =/≠ to add empty line below/above
-- I don’t use that much the `=` command anyway
vim.keymap.set("n", "=", "mzo<Esc>`z", { desc = "add a line below" })
vim.keymap.set("n", "≠", "mzO<Esc>`z", { desc = "add a line above" })

-- remapping of hjkl to other functions
-- as regular arrow movements are mapped to the arrow keys, to another layer

-- [h]op between buffers
vim.keymap.set("n", "h", ":ob workspace:next-tab<CR>", { desc = "[h]op to next buffer" })
vim.keymap.set("n", "H", ":ob workspace:previous-tab<CR>", { desc = "[h]op to previous buffer" })

-- [j]oin lines
vim.keymap.set("n", "j", "J", { desc = "[j]oin next line to the current" })
vim.keymap.set("n", "gj", "gJ", { desc = "[j]oin next line to the current (without blank space)" })
vim.keymap.set("n", "J", "kJ", { desc = "[j]oin current line to the previous" })
vim.keymap.set("n", "gJ", "kgJ", { desc = "[j]oin current line to the previous (without blank space)" })

-- [k]nit lines
-- opposite functions to j/J
vim.keymap.set("n", "k", "i<CR><Esc>", { desc = "Unjoin to the next line" })

-- [l]ean back : just a shortcut for ge/gE
vim.keymap.set({ "n", "x", "o" }, "l", "ge", { desc = "go to previous end ([l]ean back)" })
vim.keymap.set({ "n", "x", "o" }, "L", "gE", { desc = "go to previous END ([l]ean back)" })

vim.keymap.set("n", "\\", "?", { desc = "search backwards" }) -- due to the symmetry between \ and / on symbol layer

-- ──────────────────────────────────────────────────────────────────────────────
-- (VISUAL MODE)
-- ──────────────────────────────────────────────────────────────────────────────

-- double v to enter visual block mode
vim.keymap.set("v", "v", "<C-v>", { desc = "[v]isual block mode" })

-- multiple V in visual line mode
vim.keymap.set("v", "V", "j", { desc = "select next line" }) --

vim.keymap.set("v", "<", "<gv", { desc = "Indent selection to the left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selection to the right" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (INSERT MODE)
-- ──────────────────────────────────────────────────────────────────────────────

-- ──────────────────────────────────────────────────────────────────────────────
-- (AUTOFILLS)

local voyels = { "e", "i", "o" }
local qs = { "q", "Q" }

for _, q in pairs(qs) do
	for _, voyel in pairs(voyels) do
		vim.keymap.set("i", q .. voyel, q .. "u" .. voyel, { desc = q .. voyel .. " autofill" })
	end
end

-- ──────────────────────────────────────────────────────────────────────────────
-- (FOLDS)
-- ──────────────────────────────────────────────────────────────────────────────

-- memo of commands coming from Vim Motions plugin :
-- za : toggle fold at cursor
-- zc/zo : [c]lose/[o]pen fold at cursor
-- zO/zC/zA : recursive open/close/toggle
-- zm/zr : fold [more]/fold less
-- zM/zR : fold/unfold all

vim.keymap.set("n", "zp", function()
	vim.cmd("ob editor:toggle-fold-properties")
end, { desc = "[p]roperties" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (MARKDOWN TEXT OBJECTS)
-- ──────────────────────────────────────────────────────────────────────────────

-- remapped text objects
-- credits : https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed
-- reminder : already existing text objects :
-- [p]aragraph
-- [s]entence
-- [t]ag
-- [w]ord / [W]ord

-- Vim Motions’ builtin text objects :
-- [*] bold or italic
-- [$] math
-- [~] strikethrough
-- [=] highlight
-- [n]umber
-- call[o]ut
-- [q]uote
-- [B]lockquote
-- [C]ode block
-- [D]ouble bracket
-- [S]ubword (in camelCase or snake_case)

-- [a]postrophes
vim.textobject.add("ia", vim.gen_spec.pair("'", "'"))
vim.textobject.add("aa", vim.gen_spec.pair("'", "'"))

-- [b]rackets
vim.textobject.add("ib", vim.gen_spec.pair("(", ")"))
vim.textobject.add("ab", vim.gen_spec.pair("(", ")"))

-- [c]urly braces
vim.textobject.add("ic", vim.gen_spec.pair("{", "}"))
vim.textobject.add("ac", vim.gen_spec.pair("{", "}"))

-- [i]nline code
vim.textobject.add("ii", vim.gen_spec.pair("`", "`"))
vim.textobject.add("ai", vim.gen_spec.pair("`", "`"))

-- wikilin[k]
vim.textobject.add("ik", vim.gen_spec.pair("[[", "]]"))
vim.textobject.add("ak", vim.gen_spec.pair("[[", "]]"))

-- [r]ectangular brackets
vim.textobject.add("ir", vim.gen_spec.pair("[", "]"))
vim.textobject.add("ar", vim.gen_spec.pair("[", "]"))

-- che[v]rons
vim.textobject.add("iv", vim.gen_spec.pair("<", ">"))
vim.textobject.add("av", vim.gen_spec.pair("<", ">"))

-- ──────────────────────────────────────────────────────────────────────────────
-- (SURROUND)
-- ──────────────────────────────────────────────────────────────────────────────

-- Vim Motions’ builtin surrounds :
-- quotes : ",',`
-- brackets : (), [], {}, <>
-- [a] >
-- [b]racket )
-- [B]race }
-- [f]unction
-- [r]ectangular bracket ]
-- [t]ag

-- NOTE: not possible to override builtin surrounds

vim.obsidian.surround.add({
	{ "c", left = "{", right = "}" }, -- [c]urly braces
	{ "C", left = "{ ", right = " }" },
	{ "e", left = "$$", right = "$$" }, -- [e]quation
	{ "g", left = "« ", right = " »" }, -- [g]uillemets, french quotation mark
	{ "G", left = "«", right = "»" }, -- by default with unbreakable spaces
	{ "i", left = "`", right = "`" }, -- [i]nline code
	{ "k", left = "[[", right = "]]" }, -- wikilin[k]
	{ "j", left = "「", right = "」" }, -- 鉤括弧, [j]apanese quotation marks
	{ "m", left = "$", right = "$" }, -- [m]ath
	{ "q", left = '"', right = '"' }, -- [q]uote
	{ "R", left = "[ ", right = " ]" }, -- [r]ectangular brackets (with space)
	{ "s", left = "~~", right = "~~" }, -- [s]trikethrough
	{ "v", left = "<", right = ">" }, -- che[v]rons
	{ "V", left = "< ", right = " >" },
	-- BUG: Vim doesn’t recognize the '×' character
	{ "×", left = "**", right = "**" }, -- bold (shifted *)
	{ "~", left = "~~", right = "~~" }, -- strikethrough
})

-- BUG: can’t delete builtin surrounds
vim.obsidian.surround.del("a")

-- ──────────────────────────────────────────────────────────────────────────────
-- (LATEX-SPECIFIC SURROUNDS)

-- using the “LaTeX environments” plugin to emulate vimtex’s surrounds commands
-- for specifically environments

-- NOTE: not sure if relevant that often

-- vim.keymap.set("v", "Se", function()
-- 	vim.cmd(":ob obsidian-latex-environments:insert-latex-env")
-- end, { desc = "LaTeX [e]nvironment" })
-- vim.keymap.set("n", "cse", function()
-- 	vim.cmd(":ob obsidian-latex-environments:change-latex-env")
-- end, { desc = "LaTeX [e]nvironment" })
-- vim.keymap.set("n", "dse", function()
-- 	vim.cmd(":ob obsidian-latex-environments:delete-latex-env")
-- end, { desc = "LaTeX [e]nvironment" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (TABLE MANIPULATION)
-- ──────────────────────────────────────────────────────────────────────────────

-- delete all table settings and keymaps
vim.opt.tablenaw = false

-- TODO: setup table navigation

-- ──────────────────────────────────────────────────────────────────────────────
-- (OBSIDIAN LEADER COMMANDS)
-- ──────────────────────────────────────────────────────────────────────────────

-- SUMMARY :
-- [d]elete…
-- [e]xport…
-- [i]nsert…
-- [l]ist…
-- [n]ew…
-- [o]pen…
-- [s]earch…
-- [r]ename…
-- [t]oggle UI…

-- ──────────────────────────────────────────────────────────────────────────────
-- (MISC)

-- save and close
vim.obsidian.leader.add({
	{ "x", "workspace:close", desc = "close current tab" },
	{ "X", "workspace:close-others", desc = "close other tabs" },
	{ "w", "obsidian-git:push", desc = "save vault ([w]rite)" },
	{ "q", "obsidian-git:backup-and-close", desc = "save and [q]uit" },
	{ "Q", "workspace:close-window", desc = "[q]uit without saving" },
})

-- misc note commands
vim.obsidian.leader.add({
	{ "cn", "file-explorer:duplicate-file", desc = "[c]opy [n]ote" },
	{ "ln", "obsidian-linter:lint-file", desc = "[l]int [n]ote" },
	{ "mn", "file-explorer:move-file", desc = "[m]ove [n]ote" },
	{ "pp", "workspace:toggle-pin", desc = "[p]in note" },
	{ "ua", "uncheck-all:uncheck-all", desc = "[u]ncheck [a]ll" },
})

-- BUG: leader command doesn’t work in visual mode ?
vim.keymap.set("v", "<leader>f", function()
	vim.cmd(":ob obsidian-furigana:add-ruby<CR>")
end, { desc = "add [f]urigana tag to selection" })

-- ──────────────────────────────────────────────────────────────────────────────
-- (DELETE)

vim.obsidian.whichkey.set_group("<leader>d", "[d]elete…", { icon = "trash-2" })

vim.obsidian.leader.add({
	{ "dh", "editor:set-heading-0", desc = "[h]eading" },
	{ "dn", "app:delete-file", desc = "[n]ote" },
})

-- ──────────────────────────────────────────────────────────────────────────────
-- (RENAME)

vim.obsidian.whichkey.set_group("<leader>r", "[r]ename…", { icon = "pen" })

vim.obsidian.leader.add({
	{ "rh", "editor:rename-heading", desc = "[h]eading" },
	{ "rn", "workspace:edit-file-title", desc = "[n]ote" },
})

-- ──────────────────────────────────────────────────────────────────────────────
-- (NOTE CREATION)

vim.obsidian.whichkey.set_group("<leader>n", "[n]ew…", { icon = "file-plus" })

vim.obsidian.leader.add({
	{ "nb", "obsidian-book-search-plugin:open-book-search-modal", desc = "[b]ook" },
	{ "nB", "bases:new-file", desc = "[B]ase" },
	{ "nc", "canvas:new-file", desc = "[c]anvas" },
	{ "nm", "moviegrabber:search-movie", desc = "[m]ovie" },
	{ "nn", "file-explorer:new-file", desc = "[n]ote" },
	{ "ns", "moviegrabber:search-series", desc = "[s]eries" },
	{ "nt", "templater-obsidian:create-new-note-from-template", desc = "note from [t]emplate" },
})
-- ──────────────────────────────────────────────────────────────────────────────
-- (INSERTION)

vim.obsidian.whichkey.set_group("<leader>i", "[i]nsert…", { icon = "square-pen" })

vim.obsidian.leader.add({
	{ "iB", "editor:toggle-blockquote", desc = "[b]lockquote" },
	{ "ir", "editor:insert-horizontal-rule", desc = "horizontal [r]ule" },
	{ "it", "templater-obsidian:insert-templater", desc = "[t]emplate" },
	{ "iT", "editor:insert-table", desc = "[t]able" },
	{ "iw", "obsidian-wikipedia:wikipedia-get-search-term", desc = "[w]ikipedia" },
})

-- insert leader keymaps ending in insert mode
vim.keymap.set("n", "<leader>iB", ":ob editor:toggle-blockquote<CR>i", { desc = "[B]lockquote" })
vim.keymap.set("n", "<leader>iC", ":ob editor:insert-codeblock<CR>i", { desc = "[C]ode block" })
vim.keymap.set("n", "<leader>ik", ":ob editor:insert-wikilink<CR>i", { desc = "wiki lin[k]" })
vim.keymap.set("n", "<leader>im", ":ob editor:insert-mathblock<CR>i", { desc = "[m]ath block" })
vim.keymap.set("n", "<leader>io", ":ob editor:insert-callout<CR>i", { desc = "call[o]ut" })

-- headings
vim.obsidian.whichkey.set_group("<leader>ih", "[h]eading…", { icon = "hash" })

for i = 1, 4 do
	vim.keymap.set("n", "<leader>ih" .. i, ":ob editor:set-heading-" .. i .. "<CR>i", { desc = "level " .. i })
end

-- completr snippet placeholder
vim.keymap.set("n", "<C-n>", ":ob templater-obsidian:jump-to-next-cursor-location<CR>i")
vim.keymap.set("i", "<C-n>", "<Esc>:ob templater-obsidian:jump-to-next-cursor-location<CR>i")

-- ──────────────────────────────────────────────────────────────────────────────
-- (LISTS)

vim.obsidian.whichkey.set_group("<leader>l", "[l]ist…", { icon = "list" })

-- WARN: <leader>ln is already taken by “lint note”

vim.obsidian.leader.add({
	{ "la", "obsidian-toggle-list:Adresse-Next", desc = "[a]dress" },
	{ "lA", "obsidian-toggle-list:Adresse-Prev", desc = "[a]dress" },
	{ "lb", "obsidian-toggle-list:Achat-Next", desc = "[b]uy" },
	{ "lB", "obsidian-toggle-list:Achat-Prev", desc = "[b]uy" },
	{ "ld", "obsidian-toggle-list:Downside-Next", desc = "[d]ownside" },
	{ "lD", "obsidian-toggle-list:Downside-Prev", desc = "[d]ownside" },
	{ "li", "obsidian-toggle-list:Idée-Next", desc = "[i]dea" },
	{ "lI", "obsidian-toggle-list:Idée-Prev", desc = "[i]dea" },
	{ "lq", "obsidian-toggle-list:Question-Next", desc = "[q]uestion" },
	{ "lQ", "obsidian-toggle-list:Question-Prev", desc = "[q]uestion" },
	{ "lt", "obsidian-toggle-list:Tâche-Next", desc = "[t]ask" },
	{ "lT", "obsidian-toggle-list:Tâche-Prev", desc = "[t]ask" },
	{ "lu", "obsidian-toggle-list:Upside-Next", desc = "[u]pside" },
	{ "lU", "obsidian-toggle-list:Upside-Prev", desc = "[u]pside" },
})

-- ──────────────────────────────────────────────────────────────────────────────
-- (SEARCH)

vim.obsidian.whichkey.set_group("<leader>s", "[s]earch…", { icon = "search" })

vim.obsidian.leader.add({
	-- { "sa", "command-palette:open", desc = "[a]ction" },
	{ "sa", "vim-motions:picker-actions", desc = "[a]ction" },
	{ "sb", "vim-motions:picker-buffers", desc = "[b]uffer" },
	{ "sf", "vim-motions:picker-pickers", desc = "[f]uzzy picker" },
	{ "sh", "hotkey-helper:open-hotkeys", desc = "[h]otkey" },
	-- { "sh", "vim-motions:picker-headings", desc = "[h]eading" },
	{ "si", "obsidian-icon-folder:iconize:set-icon-for-file", desc = "[i]con" },
	{ "sk", "vim-motions:picker-backlinks", desc = "backlin[k]" },
	{ "sl", "workspaces:save-and-load", desc = "workspace [l]ayout" },
	{ "sm", "vim-motions:picker-marks", desc = "[m]ark" },
	{ "sn", "switcher:open", desc = "[n]ote" },
	{ "so", "vim-motions:picker-outline", desc = "[o]utline" },
	{ "sp", "hotkey-helper:browse-plugins", desc = "[p]lugin" },
	{ "sr", "switcher:open", desc = "[r]ecent note" },
	{ "ss", "vim-motions:picker-livegrep", desc = "[s]tring" },
	{ "st", "vim-motions:picker-tags", desc = "[t]ag" },
	{ "sv", "app:open-vault", desc = "[v]ault" },
	{ 's"', "vim-motions:picker-registers", desc = "register" },
	{ "s,", "hotkey-helper:open-settings", desc = "settings ([,]) for plugin" },
	{ "s.", "vim-motions:picker-resume", desc = "resume last search ([.])" },
})

vim.obsidian.pick_keymap({
	split_h = { "C-v" },
	split_v = { "C-h" },
})
-- ──────────────────────────────────────────────────────────────────────────────
-- (OPEN)
vim.obsidian.whichkey.set_group("<leader>o", "[o]pen…", { icon = "external-link" })

vim.obsidian.leader.add({
	{ "od", "app:show-release-notes", desc = "[d]evelopment notes" },
	{ "of", "obsidian-spaced-repetition:srs-review-flashcards", desc = "[f]lashcards" },
	{ "og", "graph:open", desc = "[g]raph view" },
	{ "ok", "backlink:open", desc = "backlin[k]s" },
	{ "ol", "graph:open-local", desc = "[l]ocal graph" },
  -- stylua: ignore
  { "om", "obsidian-projects:show:a0094b14-78da-4708-b461-5d5cb38dabd3:3066cc1c-1851-4359-a7da-86a1efc8d99a", desc = "[m]orceaux" },
	{ "oo", "outline:open", desc = "[o]utline" },
  -- stylua: ignore
  { "op", "obsidian-projects:show:869af070-c500-4427-943a-0e244fb8e541:d35f9877-62b4-44c2-a2b9-6bf14977a0a4", desc = "[p]rojects" },
	{ "or", "random-note", desc = "[r]andom note" },
	{ "oR", "obsidian-spaced-repetition:srs-note-review-open-note", desc = "[r]andom note to [r]eview" },
	{ "o,", "app:open-settings", desc = "settings ([,])" },
})

-- ──────────────────────────────────────────────────────────────────────────────
-- (TOGGLE)

vim.obsidian.whichkey.set_group("<leader>t", "[t]oggle…", { icon = "toggle-right" })

vim.obsidian.leader.add({
	{ "te", "editor:toggle-source", desc = "[e]dition mode" },
	{ "tf", "obsidian-hider:toggle-tab-containers", desc = "[f]ocus mode" },
	{ "tk", "workspace:toggle-stacked-tabs", desc = "stac[k]ed tabs" },
	{ "tl", "app:toggle-left-sidebar", desc = "[l]eft sidebar" },
	{ "tp", "workspace:toggle-pin", desc = "[p]in" },
	{ "tr", "app:toggle-right-sidebar", desc = "[r]ight sidebar" },
	{ "tR", "recipe-view:toggle-recipe-view", desc = "[R]ecipe view" },
	{ "ts", "obsidian-hider:toggle-hider-status", desc = "[s]tatus bar" },
	{ "tt", "obsidian-hider:toggle-tab-containers", desc = "[t]ab bar" },
})

-- similar to insert heading, but don’t end in insert mode
vim.obsidian.whichkey.set_group("<leader>th", "[h]eading", { icon = "hash" })

for i = 1, 4 do
	vim.obsidian.leader.set("th" .. i, "editor:set-heading-" .. i, { desc = "level " .. i })
end

-- ──────────────────────────────────────────────────────────────────────────────
-- (PANDOC EXPORT)

vim.obsidian.whichkey.set_group("<leader>e", "[e]xport note to…", { icon = "share" })

vim.obsidian.leader.add({
	{ "eo", "obsidian-pandoc:pandoc-export-odt", desc = ".[o]dt" },
	{ "ep", "workspace:export-pdf", desc = ".[p]df (without LaTeX)" },
	{ "eP", "obsidian-pandoc:pandoc-export-pdf", desc = ".[p]df (with LaTeX)" },
	{ "et", "obsidian-pandoc:pandoc-export-latex", desc = ".[t]ex" },
})

-- ──────────────────────────────────────────────────────────────────────────────
-- (HARPOON)

-- NOTE: harpoon entirely disabled for now, as it doesn’t suit my Obsidian workflow
-- as well as in nvim

-- ──────────────────────────────────────────────────────────────────────────────
-- (ENDING)
-- ──────────────────────────────────────────────────────────────────────────────

-- ──────────────────────────────────────────────────────────────────────────────
-- (KEYMAPS DELETION)

vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gO")
