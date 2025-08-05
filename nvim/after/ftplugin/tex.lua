vim.o.wrap = true -- enable wrap lines for tex files
vim.o.linebreak = true -- wrap on words instead of characters

-- hides line numbers by default
vim.o.relativenumber = false
vim.o.number = false

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
map("n", "<leader>\\", "mzA \\\\<Esc>`z", { desc = "add line break to eol" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (ENVIRONNEMENTS)
-- ────────────────────────────────────────────────────────────────────────────────
-- just to make sure all the commands don't interfer with the rest of nvim's commands
-- because all default mappings are disabled, have to write them entirely,
-- to make sure there’s no unwanted overlaps

-- ────────────────────────────────────────────────────────────────────────────────
-- (DELETE AND CHANGE)

-- [e]nvironment
map("n", "dse", "<plug>(vimtex-env-delete)", { desc = "Delete Surrounding Environment" })
map("n", "cse", "<plug>(vimtex-env-change)", { desc = "Change Surrounding Environment" })

-- [l]aTeX command
map("n", "dsl", "<plug>(vimtex-cmd-delete)", { desc = "Delete Surrounding LaTeX command" })
map("n", "csl", "<plug>(vimtex-cmd-change)", { desc = "Change Surrounding LaTeX command" })

-- [d]elimiters
map("n", "dsd", "<plug>(vimtex-delim-delete)", { desc = "Delete Surrounding Delimiters" })
map("n", "csd", "<plug>(vimtex-delim-change)", { desc = "Change Surrounding Delimiters" })

-- [m]ath block
map("n", "dsm", "<plug>(vimtex-env-delete-math)", { desc = "Delete Surrounding Math environnement" })
map("n", "csm", "<plug>(vimtex-env-change-math)", { desc = "Change Surrounding Math environnement" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (TOGGLES)
-- TODO: ts + … interfers with the usual t{char} command, if we ever want to move towards an s letter
-- it could be interesting to map those commands to another letter,
-- or use a localleader mapping

-- toggle delimiters with \left\right : tsd
map("n", "tsd", "<plug>(vimtex-delim-toggle-modifier)", { desc = "Toggle Surrounding \\l/r Delimiters" })

map("n", "tse", "<plug>(vimtex-env-toggle-star)", { desc = "Toggle Starred Environment" })
map("n", "tsl", "<plug>(vimtex-cmd-toggle-star)", { desc = "Toggle Starred LaTeX command" })
map("n", "tsr", "<plug>(vimtex-env-toggle)", { desc = "Toggle Related environnements" })
-- TODO: implement more related-environments

-- toggle between inline and display math
map("n", "tsm", "<plug>(vimtex-env-toggle-math)", { desc = "Toggle Surrounding Math environnement" })

-- toggle between fraction modes : tsf
map("n", "tsf", "<plug>(vimtex-env-toggle-frac)", { desc = "Toggle Surrounding Fraction" })

-- TODO: implement a custom command that toggles between {…} and \{…\}

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
-- NOTE: probably interfers with next/previous function,
-- but usually in beamer code, there’s no function

-- previous/next start/end of LaTeX comment : [/] + //%
-- TODO: not sure to add this one, but I mean we never know

-- ────────────────────────────────────────────────────────────────────────────────
-- (TEXT OBJECTS)
-- ────────────────────────────────────────────────────────────────────────────────

-- [d]elimiters (also covers \left\right, which is nice)
map({ "x", "o" }, "id", "<plug>(vimtex-id)", { desc = "Delimiters" })
map({ "x", "o" }, "ad", "<plug>(vimtex-ad)", { desc = "Delimiters" })

-- [m]ath block
map({ "x", "o" }, "im", "<plug>(vimtex-i$)", { desc = "Math block" })
map({ "x", "o" }, "am", "<plug>(vimtex-a$)", { desc = "Math block" })

-- [l]aTeX text object…
require("which-key").add({ { "il", group = "LaTeX…", mode = { "x", "o" }, icon = "" } })
require("which-key").add({ { "al", group = "LaTeX…", mode = { "x", "o" }, icon = "" } })

-- [c]ommand
map({ "x", "o" }, "ilc", "<plug>(vimtex-ic)", { desc = "Command" })
map({ "x", "o" }, "alc", "<plug>(vimtex-ac)", { desc = "Command" })

-- [e]nvironment
map({ "x", "o" }, "ile", "<plug>(vimtex-ie)", { desc = "Environment" })
map({ "x", "o" }, "ale", "<plug>(vimtex-ae)", { desc = "Environment" })

-- [S]ection
map({ "x", "o" }, "ils", "<plug>(vimtex-iP)", { desc = "Section" })
map({ "x", "o" }, "als", "<plug>(vimtex-aP)", { desc = "Section" })

-- itemize/enumerate item
-- TODO: find a mapping for this one

-- ────────────────────────────────────────────────────────────────────────────────
-- (COMMANDS)
-- ────────────────────────────────────────────────────────────────────────────────

require("which-key").add({ { "<localleader>l", group = "LaTeX…", icon = "" } })

map("n", "<localleader>b", "<cmd>wa<cr><cmd>VimtexCompileSS<cr>", { desc = "Build project (single-shot)" })
-- NOTE: this ensures the entire project gets saved before compiling
map("n", "<localleader>B", "<plug>(vimtex-compile)", { desc = "Build project (continuous)" })
map("n", "<localleader>c", "<plug>(vimtex-clean)", { desc = "Clean aux files" })
map("n", "<localleader>C", "<plug>(vimtex-clean-full)", { desc = "Clean aux and output files" })
map("n", "<localleader>s", "<plug>(vimtex-toc-toggle)", { desc = "toggle table of contents (Sommaire)" })
map("n", "<localleader>v", "<plug>(vimtex-view)", { desc = "View PDF" })
map("n", "<localleader>x", "<plug>(vimtex-errors)", { desc = "open errors" })

-- TODO: add word count, in lualine maybe ?
