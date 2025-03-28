return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
    "folke/which-key.nvim",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true }, -- enable syntax highlighting
      indent = { enable = true }, -- enable indentation

      ensure_install = {
        "bash",
        "bibtex",
        "c",
        "cpp",
        "css",
        "editorconfig",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "r",
        "regex",
        "tex",
        "tmux",
        "toml",
        "sty",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },

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

            -- [gc]omments
            -- same syntax as Comment.nvim
            ["agc"] = { query = "@comment.outer", desc = "outer part of an Comment" },
            ["igc"] = { query = "@comment.inner", desc = "inner part of an Comment" },

            -- coding text [o]bjects

            -- [a]ssignment
            ["aoa"] = { query = "@assignment.outer", desc = "outer part of an Assignment" },
            ["ioa"] = { query = "@assignment.inner", desc = "inner part of an Assignment" },
            ["loa"] = { query = "@assignment.lhs", desc = "left hand side of an Assignment" },
            ["roa"] = { query = "@assignment.rhs", desc = "right hand side of an Assignment" },

            -- function/method [d]efinition
            ["aod"] = { query = "@function.outer", desc = "outer part of a function Definition" },
            ["iod"] = { query = "@function.inner", desc = "inner part of a function Definition" },

            -- [f]unction call
            ["aof"] = { query = "@call.outer", desc = "outer part of a Function call" },
            ["iof"] = { query = "@call.inner", desc = "inner part of a Function call" },

            -- [i]f else
            ["aoi"] = { query = "@conditional.outer", desc = "outer part of a conditional" },
            ["ioi"] = { query = "@conditional.inner", desc = "inner part of a conditional" },

            -- [l]oop
            ["aol"] = { query = "@loop.outer", desc = "outer part of a Loop" },
            ["iol"] = { query = "@loop.inner", desc = "inner part of a Loop" },

            -- function [p]arameter
            ["aop"] = { query = "@parameter.outer", desc = "outer part of a function Parameter" },
            ["iop"] = { query = "@parameter.inner", desc = "inner part of a function Parameter" },

            -- function [r]eturn
            ["aor"] = { query = "@return.outer", desc = "outer part of a function Return" },
            ["ior"] = { query = "@return.inner", desc = "inner part of a function Return" },
          },
        },
      },
    })

    local treesitter_context = require("treesitter-context")

    treesitter_context.setup({
      enable = true,
    })

    -- keymaps

    local map = vim.keymap.set
    map("n", "<leader>ti", "<cmd>InspectTree<cr>", { desc = "Inspect TreeSitter" })
    map("n", "<leader>ut", "<cmd>InspectTree<cr>", { desc = "open TreeSitter" })
    -- stylua: ignore start
    map("n", "<leader>tc", function() treesitter_context.go_to_context(vim.v.count1)end, { desc = "go back to Context", silent = true })
    map("n", "[c", function() treesitter_context.go_to_context(vim.v.count1)end, { desc = "go back to Context", silent = true })
    -- stylua: ignore end
    require("which-key").add({ { "<leader>t", group = "TreeSitter…", icon = { icon = "󰔱", color = "green" } } })
  end,
}
