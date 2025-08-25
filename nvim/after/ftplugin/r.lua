-- TODO: decide how to setup this, either with :
-- lintr, after/ftplugin or .editorconfig
-- vim.opt_local.shiftwidth = 4
-- vim.opt_local.tabstop = 2

-- ────────────────────────────────────────────────────────────────────────────────
-- (KEYMAPS)
-- ────────────────────────────────────────────────────────────────────────────────

local map = require("core.utils").map
local wk = require("which-key")

-- ────────────────────────────────────────────────────────────────────────────────
-- [r] control

wk.add({ { "<locallleader>r", group = "R…", icon = "" } })

map("n", "<locallleader>rs", "<Plug>RStart", { desc = "Start" })
map("n", "<locallleader>rS", "<Plug>RCustomStart", { desc = "Start (custom)" })
map("n", "<locallleader>rq", "<Plug>RSaveClose", { desc = "Quit" })
map("n", "<locallleader>rQ", "<Plug>RClose", { desc = "Quit (without saving workspace)" })

-- ────────────────────────────────────────────────────────────────────────────────
-- [i]nsertion

wk.add({ { "<locallleader>i", group = "Insert…", icon = "󰗧" } })

map("n", "<locallleader>ic", "<Plug>RmdInsertChunk", { desc = "Chunk delimiter" })

-- ────────────────────────────────────────────────────────────────────────────────
-- [v]iew

wk.add({ { "<locallleader>s", group = "View…", icon = "" } })

map("n", "<locallleader>vd", "<Plug>RViewDF", { desc = "Data.frame/matrix under cursor" })

-- ────────────────────────────────────────────────────────────────────────────────
-- [s]end to R

wk.add({ { "<locallleader>s", group = "Send to R…", icon = "" } })

-- current [l]ine
map("n", "<locallleader>sl", "<Plug>RDSendLine", { desc = "current Line" })
map({ "n", "i" }, "<C-CR>", "<Plug>RDSendLine", { desc = "Send Current Line" })

-- next paragraph
map("n", "<locallleader>sp", "<Plug>RDSendParagraph", { desc = "next Paragraph" })

-- visual selection
map("v", "<locallleader>s", "<Plug>RDSendSelection", { desc = "Send to R" })

-- current [c]hunk
map("n", "<locallleader>sc", "<Plug>RDSendChunk", { desc = "current Chunk" })

-- entire [F]ile
map("n", "<locallleader>sF", "<Plug>RSendFile", { desc = "entire File" })
