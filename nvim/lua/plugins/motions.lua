return {
  {
    "chrisgrieser/nvim-spider",
    keys = {
      -- stylua: ignore start
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "next Word" },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "next End of word" },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "previous word (Backwards)" },
      { "l", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "previous end of word (Lean back)" },
      -- stylua: ignore end
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
      -- map({ "n", "x", "o" }, "<leader>Th", function() flash.treesitter() end, { desc = "Hop treesitter nodes" } )
      -- a more accurate mapping with treesitter leader

      -- stylua: ignore end
    end,
  },
}
