return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- disable everything by default,
    -- only enabling components one by one
    bigfile = { enabled = false },
    dashboard = {
      width = 60,
      -- stylua: ignore start
      -- big Outer Wilds fan here
      -- credits : https://github.com/HolyShaq/nvim-config/blob/5895a9d95f26027f739b0a98254cff871a4c7f97/lua/plugins/alpha-dashboard.lua
      preset = {
        header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣄⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣄⠀⠀⠀⠀⠀⠀⢴⣾⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣟⠛⠛⠛⠛⣻⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⣼⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡟⢻⣿⣿⣆⠀⠀⠀⠀⠀⠀⢻⣿⣿⣧⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣷⣼⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡟⠀⠀⠻⣿⣿⣧⡀⠀⠀⠀⠀⠀⢻⣿⣿⣧⠀⠀⠀⠀⠀
⠀⠀⠀⣀⣤⣾⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠏⠀⠀⠀⠀⠙⣿⣿⣷⡀⠀⠀⠀⠀⠀⠹⣿⣿⣷⡀⠀⠀⠀
⠀⠀⠀⠙⣿⣿⣿⡍⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⡄⠀⠀⠀⠀⠀⠙⣿⣿⣷⡀⠀⠀⠀⠀⢠⣾⣿⣿⠃⠀⠀⠀
⠀⠀⠀⠀⠈⢿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⢿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣄⠀⠀⠀⠀⠀⠘⢿⣿⣿⣄⠀⠀⣠⣿⣿⡿⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡿⠁⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⣰⣿⣿⡿⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⡟⠁⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⣿⣿⡟⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⢻⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠹⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        -- stylua: ignore end
        keys = {
          { action = ":ene | startinsert", desc = " New File", icon = " ", key = "n" },
          { action = ":Telescope find_files", desc = " Find File", icon = " ", key = "f" },
          {
            action = "Telescope find_files hidden=true no_ignore=true",
            desc = " Find File (show hidden)",
            icon = " ",
            key = "F",
          },
          { action = ":Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
          -- TODO: add config quick opener
          -- { action = "Telescope find_files(cwd=vim.fn.stdpath('config'))", desc = " Config", icon = " ", key = "c" },
          { action = ":LazyGit", desc = " Git", icon = "󰊢 ", key = "g" },
          { action = ":Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = ":Mason", desc = " Mason", icon = "󰟾 ", key = "m" },
          { action = ":Yazi cwd", desc = " Yazi", icon = "󰇥 ", key = "y" },
          {
            action = ':lua require("persistence").load()',
            desc = " Restore session",
            icon = " ",
            key = "s",
          },
          {
            action = ':lua require("persistence").select()',
            desc = " Select a session",
            icon = "󰍂 ",
            key = "S",
          },
          {
            action = ":qa",
            desc = "Quit",
            icon = " ",
            key = "q"
          }
        },
      },
    },
    explorer = { enabled = false },
    -- TODO: compare it with indent-blankline
    indent = { enabled = false },
    gitbrowse = { enabled = true },
    lazygit = {
      enabled = true,
    },
    picker = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    -- TODO: setup properly toggles
    toggle = { enabled = false },
    words = { enabled = false },
  },
}
