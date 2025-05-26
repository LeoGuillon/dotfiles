local M = {}

-- ────────────────────────────────────────────────────────────────────────────────

-- function for keymaps
-- make sure have `local map = require("utils").map` at the beginning of a config file
function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- neovim’s text expanders
---@param text string
---@param replace string
function M.buffer_abbrev(text, replace)
  vim.keymap.set("ia", text, replace, { buffer = true })
end

-- ────────────────────────────────────────────────────────────────────────────────
-- (CUSTOM ICONS)

local icons = {
  diagnostics = {},
  git = {},
  ui = {
    -- lazy,
    -- git,
    -- harpoon,
    -- mason,
    -- snippets,
    -- telescope,
    -- treesitter,
    -- yazi
  },
}

-- ────────────────────────────────────────────────────────────────────────────────
return M
