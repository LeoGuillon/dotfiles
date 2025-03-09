return {
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
  },
  -- {
  --   "ggandor/leap.nvim",
  --   vim.keymap.set({ "n", "x", "o" }, "l", "<Plug>(leap-forward)", { desc = "Leap forward" }),
  --   vim.keymap.set({ "n", "x", "o" }, "L", "<Plug>(leap-backward)", { desc = "Leap backwards" }),
  --   vim.keymap.set({ "n", "x", "o" }, "gl", <Plug>(leap-from-window)", { desc = "Leap from window" }),
  -- },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   dependancies = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     local flash = require("flash")
  --
  --     -- setup
  --     flash.setup({
  --       labels = "aesnflrtiucodvhpmqyxgzk", -- ergo-l layout
  --       search = {},
  --       jump = {
  --         autojump = true,
  --       },
  --       label = {},
  --       modes = {
  --         -- regular search through / or \
  --         search = {},
  --
  --         -- search through fFtT and ,;
  --         char = {
  --           jump_labels = true,
  --           char_actions = function(motion)
  --             return {
  --               -- swap , and ; due to ergo-L layout
  --               [","] = "next",
  --               [";"] = "previous",
  --               [motion:lower()] = "next",
  --               [motion:upper()] = "prev",
  --             }
  --           end,
  --           jump = {
  --             autojump = false,
  --           },
  --         },
  --
  --         -- treesitter selection
  --         treesitter = {},
  --       },
  --     })
  --     -- keymaps
  --     local map = vim.keymap.set
  --
  --     -- stylua: ignore start
  --     map({ "n", "x", "o" }, "h", function() flash.jump() end, { desc = "Hop (flash)" } )
  --     map({ "n", "x", "o" }, "H", function() flash.treesitter() end, { desc = "Hop treesitter nodes" } )
  --
  --     -- stylua: ignore end
  --   end,
  -- },
}
