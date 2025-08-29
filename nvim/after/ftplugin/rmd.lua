-- ──────────────────────────────────────────────────────────────────────────────
-- OPTIONS
-- ──────────────────────────────────────────────────────────────────────────────

vim.opt_local.wrap = true
vim.opt_local.linebreak = true

vim.opt_local.number = false
vim.opt_local.relativenumber = false

-- ──────────────────────────────────────────────────────────────────────────────
-- KEYMAPS
-- ──────────────────────────────────────────────────────────────────────────────

-- ──────────────────────────────────────────────────────────────────────────────
-- COMPLETION
-- ──────────────────────────────────────────────────────────────────────────────

local cmp = require("cmp")
cmp.setup.buffer({
  sources = {
    { name = "luasnip" },
    { name = "cmp_r" }, -- no lsp since most of the completions are handled by R.nvim
    { name = "path" },
    { name = "buffer" },
  },
})
