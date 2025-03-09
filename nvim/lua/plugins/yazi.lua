return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    { "folke/snacks.nvim", lazy = true },
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>y",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "open Yazi at current file",
    },
    {
      -- Open in the current working directory
      "<leader>Y",
      mode = { "n", "v" },
      "<cmd>Yazi cwd<cr>",
      desc = "open Yazi at cwd",
    },
    {
      "<leader>uy",
      "<cmd>Yazi toggle<cr>",
      desc = "toggle Yazi",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
