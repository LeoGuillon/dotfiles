vim.opt_local.wrap = true -- enable wrap lines for tex files
vim.opt_local.linebreak = true -- wrap on words instead of characters

-- hides line numbers by default
vim.opt_local.relativenumber = false
vim.opt_local.number = false

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
  { "l", "c", "LaTeX command" },
  { "m", "$", "Math block" },
  { "i", "m", "Item" }, -- override [i]nline code, as backticks are quit rare in LaTeX
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

-- [d]elimiters
map("n", "dsd", "<plug>(vimtex-delim-delete)", { desc = "Delete Surrounding Delimiters" })
map("n", "csd", "<plug>(vimtex-delim-change)", { desc = "Change Surrounding Delimiters" })
map("n", "tsd", "<plug>(vimtex-delim-toggle-modifier)", { desc = "Toggle Surrounding \\l/r Delimiters" })
map("n", "tsr", "<plug>(vimtex-env-toggle)", { desc = "Toggle Related environnements" })

-- [e]nvironment
map("n", "dse", "<plug>(vimtex-env-delete)", { desc = "Delete Surrounding Environment" })
map("n", "cse", "<plug>(vimtex-env-change)", { desc = "Change Surrounding Environment" })
map("n", "ysse", "<plug>(vimtex-env-surround-line)", { desc = "Surround line with Environment" })
map("x", "Se", "<plug>(vimtex-env-surround-visual)", { desc = "Surround selection with Environment" })
map("n", "tse", "<plug>(vimtex-env-toggle-star)", { desc = "Toggle Starred Environment" })

-- [l]aTeX command
map("n", "dsl", "<plug>(vimtex-cmd-delete)", { desc = "Delete Surrounding LaTeX command" })
map("n", "csl", "<plug>(vimtex-cmd-change)", { desc = "Change Surrounding LaTeX command" })
map("n", "tsl", "<plug>(vimtex-cmd-toggle-star)", { desc = "Toggle Starred LaTeX command" })
map("n", "ysl", "<plug>(vimtex-cmd-create)", { desc = "Surround current word with LaTeX command" })
map("x", "Sl", "<plug>(vimtex-cmd-create)", { desc = "Surround selection with LaTeX command" })

-- [m]ath block
map("n", "dsm", "<plug>(vimtex-env-delete-math)", { desc = "Delete Surrounding Math environnement" })
map("n", "csm", "<plug>(vimtex-env-change-math)", { desc = "Change Surrounding Math environnement" })
map("n", "tsm", "<plug>(vimtex-env-toggle-math)", { desc = "Toggle Surrounding Math environnement" })
-- TODO: commands to add math mode in normal and visual mode

-- ────────────────────────────────────────────────────────────────────────────────
-- (NAVIGATION)
-- ────────────────────────────────────────────────────────────────────────────────

-- between beginning/end of sections, subsections or subsubsections : [[ / ]], same logic than with markdown
map({ "n", "x", "o" }, "]]", "<plug>(vimtex-]])", { desc = "Next Section beginning" })
map({ "n", "x", "o" }, "[[", "<plug>(vimtex-[[)", { desc = "Previous Section beginning" })
map({ "n", "x", "o" }, "][", "<plug>(vimtex-][)", { desc = "Next Section end" })
map({ "n", "x", "o" }, "[]", "<plug>(vimtex-[])", { desc = "Previous Section end" })

-- between beginning/end of environnements :
map({ "n", "x", "o" }, "]e", "<plug>(vimtex-]m)", { desc = "Next Env. \\begin{}" })
map({ "n", "x", "o" }, "[e", "<plug>(vimtex-[m)", { desc = "Previous Env. \\begin{}" })
map({ "n", "x", "o" }, "]E", "<plug>(vimtex-]M)", { desc = "Next Env. \\end{}" })
map({ "n", "x", "o" }, "[E", "<plug>(vimtex-[M)", { desc = "Previous Env. \\end{}" })

-- between beginning/end of math environnements :
map({ "n", "x", "o" }, "]m", "<plug>(vimtex-]n)", { desc = "Next Math block" })
map({ "n", "x", "o" }, "[m", "<plug>(vimtex-[n)", { desc = "Previous Math block" })
map({ "n", "x", "o" }, "]M", "<plug>(vimtex-]N)", { desc = "Next Math block" })
map({ "n", "x", "o" }, "[M", "<plug>(vimtex-[N)", { desc = "Previous Math block" })

-- between beginning/end of beamer frames : [/] + f/F
map({ "n", "x", "o" }, "]f", "<plug>(vimtex-]r)", { desc = "Next Frame" })
map({ "n", "x", "o" }, "[f", "<plug>(vimtex-[r)", { desc = "Previous Frame" })
map({ "n", "x", "o" }, "]F", "<plug>(vimtex-]R)", { desc = "Next Frame end" })
map({ "n", "x", "o" }, "[F", "<plug>(vimtex-[R)", { desc = "Previous Frame end" })

-- go to matching pair, adapted to LaTeX delimiters
map({ "n", "v" }, "%", "<plug>(vimtex-%)", { desc = "Go to matching delimiter" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (LOCALLEADER COMMANDS)
-- ────────────────────────────────────────────────────────────────────────────────

map("n", "<localleader>b", "<cmd>wa<cr><cmd>VimtexCompileSS<cr>", { desc = "Build project (single-shot)" })
map("n", "<localleader>B", "<plug>(vimtex-compile)", { desc = "Build project (continuous)" })
map("n", "<localleader>c", "<plug>(vimtex-clean)", { desc = "Clean aux files" })
map("n", "<localleader>C", "<plug>(vimtex-clean-full)", { desc = "Clean aux and output files" })
map("n", "<localleader>s", "<plug>(vimtex-toc-toggle)", { desc = "toggle table of contents (Sommaire)" })
map("n", "<localleader>v", "<plug>(vimtex-view)", { desc = "View PDF" })
map("n", "<localleader>x", "<plug>(vimtex-errors)", { desc = "open errors" })
map("n", "<locallleader>l", "<cmd>VimtexCountLetters<cr>", { desc = "count Letters in project" })
map("n", "<locallleader>L", "<cmd>VimtexCountLetters!<cr>", { desc = "count Letters for each file" })
map("n", "<locallleader>w", "<cmd>VimtexCountWords<cr>", { desc = "count Words in project" })
map("n", "<locallleader>W", "<cmd>VimtexCountWords!<cr>", { desc = "count Words for each file" })
