local M = {}

-- ────────────────────────────────────────────────────────────────────────────────

-- function for keymaps
-- make sure have `local map = require("utils").map` at the beginning of a config file
---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? { desc?: string, unique?: boolean, remap?: boolean, silent?:boolean }
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

function M.generate_plugins_list()
  local plugins = require("lazy").plugins()
  local file_path = vim.fn.stdpath("config") .. "/plugins-list.md"
  local file = io.open(file_path, "w")

  file:write("# Neovim plugins list\n")

  for _, plugin in ipairs(plugins) do
    local name = plugin.name or plugin[1]
    local url = plugin.url or ("https://github.com/" .. plugin[1])

    file:write(string.format("- [%s](%s)\n", name, url))
  end

  file.close()
  print("Generated file: " .. file_path)
end

-- ────────────────────────────────────────────────────────────────────────────────
-- (CUSTOM ICONS)

-- TODO: setup unified icons
M.icons = {
  diagnostics = {
    error = "",
    warn = "",
    info = "",
    hint = "󰌵",
  },
  git = {},
  ui = {
    checkhealth = "",
    git = "",
    harpoon = "󰀱",
    lazy = "󰒲",
    lsp = "",
    mason = "󰟾",
    snippets = "",
    telescope = "󰭎",
    treesitter = "󰔱",
    yazi = "󰇥",
  },
}

-- ────────────────────────────────────────────────────────────────────────────────
return M
