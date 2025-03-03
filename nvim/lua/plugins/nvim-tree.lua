return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    update_focused_file = { enable = true },
    view = {
      side = "right",
    },
  },
  config = function()
    -- (CUSTOM ACTIONS)
    local api = require("nvim-tree.api")

    local function edit_or_open()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file
        api.node.open.edit()
        -- Close the tree if file was opened
        api.tree.close()
      end
    end

    -- open as vsplit on current node
    local function vsplit_preview()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file as vsplit
        api.node.open.vertical()
      end

      -- Finally refocus on tree if it was lost
      api.tree.focus()
    end

    -- (SIMPLER STATUSLINE)
    -- api.events.subscribe(api.events)
    -- api.events.subscribe(api.events.Event.TreeOpen, function()
    --   local tree_winid = api.tree.winid()
    --
    --   if tree_winid ~= nil then
    --     vim.api.nvim_set_option_value('statusline', ' ', {win = tree_winid})
    --   end
    -- end)

    -- (KEYMAPS)
    local map = vim.keymap.set
    map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

    -- navigation
    -- map("n", "<Right>", edit_or_open,          { desc = "Edit Or Open" })
    -- map("n", "<S-Right>", vsplit_preview,        { desc = "Vsplit Preview"} )
    -- map("n", "<Left>", api.tree.close,        { desc = "Close"} )
    -- map("n", "<S-Left>", api.tree.collapse_all, { desc = "Collapse All"} )

    -- display
    -- map("n", ".", api.tree.toggle_help, { desc = "Toggle dotfiles display"})
    -- editing

    require("nvim-tree").setup({})
  end,
}
