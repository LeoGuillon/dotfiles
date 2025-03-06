return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "folke/which-key.nvim",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true }, -- enable syntax highlighting
      indent = { enable = true }, -- enable indentation

      -- incremental selection : select current block
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>tv",
          node_incremental = "<leader>tn",
          scope_incremental = "<leader>ts",
          node_decremental = "<leader>td",
        },
      },

      -- text objects setup
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- allows to look forward for text-objects

          keymaps = {

            -- [a]ssignment
            ["aa"] = { query = "@assignment.outer", desc = "outer part of an assignment" },
            ["ia"] = { query = "@assignment.inner", desc = "inner part of an assignment" },
            ["la"] = { query = "@assignment.lhs", desc = "left hand side of an assignment" },
            ["ra"] = { query = "@assignment.rhs", desc = "right hand side of an assignment" },

            -- coding text [o]bjects

            -- [c]omments
            ["aoc"] = { query = "@comment.outer", desc = "outer part of an comment" },
            ["ioc"] = { query = "@comment.inner", desc = "inner part of an comment" },

            -- [i]f else
            ["aoi"] = { query = "@conditional.outer", desc = "outer part of a conditional" },
            ["ioi"] = { query = "@conditional.inner", desc = "inner part of a conditional" },

            -- [l]oop
            ["aol"] = { query = "@loop.outer", desc = "outer part of a loop" },
            ["iol"] = { query = "@loop.inner", desc = "inner part of a loop" },

            -- [f]unction call
            ["aof"] = { query = "@call.outer", desc = "outer part of a function call" },
            ["iof"] = { query = "@call.inner", desc = "inner part of a function call" },

            -- function or class [d]efinition
            ["aod"] = { query = "@call.outer", desc = "outer part of a function definition" },
            ["iod"] = { query = "@call.inner", desc = "inner part of a function definition" },

            -- function [p]arameter
            ["aop"] = { query = "@parameter.outer", desc = "outer part of a function parameter" },
            ["iop"] = { query = "@parameter.inner", desc = "inner part of a function parameter" },
          },
        },
      },
    })

    -- keymaps

    local map = vim.keymap.set
    map("n", "<leader>ti", "<cmd>InspectTree<cr>", { desc = "Displays TreeSitter" })

    require("which-key").add({ { "<leader>t", group = "TreeSitter…" } })
  end,
}
