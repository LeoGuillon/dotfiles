return {
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    dependancies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local flash = require("flash")

      -- setup
      flash.setup({
        labels = "aesnflrtiucodvhpmqyxgzk", -- ergo-l layout
        search = {},
        jump = {
          autojump = true,
        },
        label = {},
        modes = {
          -- regular search through / or \
          search = {
            enabled = true,
          },

          -- search through fFtT and ,;
          char = {
            enabled = false,
          },

          -- treesitter selection
          treesitter = {},
        },
      })
      -- keymaps
      local map = vim.keymap.set

      -- stylua: ignore start
      map({ "n", "x", "o" }, "h", function() flash.jump() end, { desc = "Hop (flash)" } )
      map({ "n", "x", "o" }, "H", function() flash.treesitter() end, { desc = "Hop treesitter nodes" } )
      map({ "n", "x", "o" }, "<leader>th", function() flash.treesitter() end, { desc = "Hop treesitter nodes" } )
      -- a more accurate mapping with treesitter leader

      -- stylua: ignore end
    end,
  },
}
