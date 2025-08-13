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
      highlight = {
        enable = true, -- enable syntax highlighting
        disable = { "latex" }, -- but disable for tex files, as we use vimtex’s syntax highlighting
      },
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
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "r",
        "regex",
        "rnoweb",
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
          init_selection = "<leader>Tv",
          node_incremental = "<leader>Tn",
          scope_incremental = "<leader>Ts",
          node_decremental = "<leader>Td",
        },
      },

      -- text objects setup
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- allows to look forward for text-objects

          keymaps = {

            -- TODO: mettre aussi sur l’enchaînement aoc/aogc ?

            -- coding text [o]bjects

            -- [a]ssignment
            ["aoa"] = { query = "@assignment.outer", desc = "Assignment" },
            ["ioa"] = { query = "@assignment.inner", desc = "Assignment" },
            -- ["loa"] = { query = "@assignment.lhs", desc = "left hand side of an Assignment" },
            -- ["roa"] = { query = "@assignment.rhs", desc = "right hand side of an Assignment" },

            -- [c]omment
            ["aoc"] = { query = "@comment.outer", desc = "Comment" },
            ["ioc"] = { query = "@comment.inner", desc = "Comment" },

            -- function/method [d]efinition
            ["aod"] = { query = "@function.outer", desc = "function Definition" },
            ["iod"] = { query = "@function.inner", desc = "function Definition" },

            -- [f]unction call
            ["aof"] = { query = "@call.outer", desc = "Function call" },
            ["iof"] = { query = "@call.inner", desc = "Function call" },

            -- [i]f else
            ["aoi"] = { query = "@conditional.outer", desc = "conditional If/else" },
            ["ioi"] = { query = "@conditional.inner", desc = "conditional If/else" },

            -- [l]oop
            ["aol"] = { query = "@loop.outer", desc = "Loop" },
            ["iol"] = { query = "@loop.inner", desc = "Loop" },

            -- function [p]arameter
            ["aop"] = { query = "@parameter.outer", desc = "function Parameter" },
            ["iop"] = { query = "@parameter.inner", desc = "function Parameter" },

            -- function [r]eturn
            ["aor"] = { query = "@return.outer", desc = "function Return" },
            ["ior"] = { query = "@return.inner", desc = "function Return" },
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
    map("n", "<leader>ot", "<cmd>InspectTree<cr>", { desc = "TreeSitter" })
    -- stylua: ignore start
    -- map("n", "<leader>tc", function() treesitter_context.go_to_context(vim.v.count1)end, { desc = "go back to Context", silent = true })
    map("n", "[c", function() treesitter_context.go_to_context(vim.v.count1)end, { desc = "go back to Context", silent = true })
    -- stylua: ignore end
    require("which-key").add({ { "<leader>T", group = "TreeSitter…", icon = { icon = "󰔱", color = "green" } } })
    require("which-key").add({
      { "io", group = "treesitter text Object…", mode = { "x", "o" }, icon = "󰔱", color = "green" },
    })
    require("which-key").add({
      { "ao", group = "treesitter text Object…", mode = { "x", "o" }, icon = "󰔱", color = "green" },
    })
  end,
}
