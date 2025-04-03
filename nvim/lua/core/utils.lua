local M = {}

-- ────────────────────────────────────────────────────────────────────────────────

-- TODO: custom mapping function, with silent and non-recursive by default

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
