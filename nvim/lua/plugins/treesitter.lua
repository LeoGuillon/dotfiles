return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- (CONFIGURATION)
    treesitter.setup({

      highlight = { enable = true },-- enable syntax highlighting
      indent = { enable = true },-- enable indentation

      -- installed and setup languages parsers
      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "cpp",
        "css",
        "csv",
        "editorconfig",
        "gitignore",
        "html",
        "javascript",
        "json",
        "julia",
        "just",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "r",
        "scss",
        "sql",
        "tmux",
        "toml",
        "typescript",
        "vim",
        "yaml",
      },
      -- incremental selection : select current block
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
