vim.o.wrap = true -- enable wrap lines for tex files
vim.o.linebreak = true -- wrap on words instead of characters

-- hides line numbers by default
vim.o.relativenumber = false
vim.o.number = false

local map = vim.keymap.set

-- ────────────────────────────────────────────────────────────────────────────────
-- typographic commodities

-- overrides the trailing characters commands

-- fine insecable space
map("n", "<leader>;", "mzA\\,;<Esc>`z", { desc = "add ; to eol" })
map("n", "<leader>!", "mzA\\,!<Esc>`z", { desc = "add ! to eol" })
map("n", "<leader>?", "mzA\\,?<Esc>`z", { desc = "add ? to eol" })

-- insecable
map("n", "<leader>:", "mzA~:<Esc>`z", { desc = "add : to eol" })
map("n", "<leader>\\\\", "mzA \\\\<Esc>`z", { desc = "add line break to eol" })

-- return {
--   -- {
--   --   "lervag/vimtex",
--   --   lazy = false -- don't want this to be lazy-loaded
--   -- }
-- }
