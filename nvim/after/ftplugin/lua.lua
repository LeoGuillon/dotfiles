local map = require("core.utils").map

-- ────────────────────────────────────────────────────────────────────────────────
-- (FIXES DUE TO HABITS IN OTHER LANGUAGES)

map("ia", "!=", "~=")

-- ────────────────────────────────────────────────────────────────────────────────
-- (AUTO-COMMA FOR TABLES)
-- credits : https://github.com/chrisgrieser/.config/blob/main/nvim/after/ftplugin/lua.lua

-- vim.api.nvim_create_autocmd("TextChangedI", {
--   desc = "User (buffer-specific): auto-comma for tables",
--   buffer = 0,
--   group = vim.api.nvim_create_augroup("lua-autocomma", { clear = true }),
--   callback = function()
--     local node = vim.treesitter.get_node()
--     if node and node:type() == "table_constructor" then
--       local line = vim.api.nvim_get_current_line()
--       if line:find("^%s*[^,%s%-]$") then
--         vim.api.nvim_set_current_line(line .. ",")
--       end
--     end
--   end,
-- })

-- ──────────────────────────────────────────────────────────────────────────────
-- COMPLETION
-- ──────────────────────────────────────────────────────────────────────────────

local cmp = require("cmp")
cmp.setup.buffer({
  sources = {
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "lazydev" },
    { name = "nerdfont" },
    { name = "path" },
    { name = "buffer" },
  },
})

-- ────────────────────────────────────────────────────────────────────────────────
