return {
  -- MASON
  {
    "mason-org/mason.nvim",
    keys = {
      { "<leader>om", "<cmd>Mason<cr>", desc = "Mason" },
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
          border = "rounded",
          width = 0.8,
          height = 0.9,
          keymaps = {
            toggle_package_expand = "o",
            toggle_help = "?",
          },
        },
      })
    end,
  },
  -- MASON-LSPCONFIG
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
        -- list of servers for mason to install
        -- list of available servers : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        -- TODO: setup LSPs for :
        -- C/C++
        -- julia
        -- json, toml
        -- Web dev : HTML/CSS/SASS/JS/TS
        ensure_installed = {
          -- ────────────────────────────────────────────────────────────────────────────────
          -- (LSP)

          -- "air", -- more recent lsp & formatter for R written in Rust, but still in beta
          "bashls",
          -- "clangd",
          "cssls",
          -- "css_variables",
          -- "html",
          "jsonls",
          -- "julials",
          -- "ltex-ls" -- grammar and spell checker for latex and md
          "lua_ls",
          "r_language_server", -- R
          -- "taplo", -- toml
          "texlab", -- latex lsp
          "vimls", -- vimscript lsp
          "yamlls",

          -- ────────────────────────────────────────────────────────────────────────────────
          -- (FORMATTERS)
          -- BUG: why putting formatters here aren’t recognized

          -- "clang-format", -- c, c++
          -- -- "jupytext", -- julia, R, Rmd
          -- "prettier", -- html, css, scss, md, javascript, typescript, json
          -- "ruff", -- python
          -- "stylua", -- lua
          -- -- "taplo", -- toml
          -- "tex-fmt", -- latex
        },
      })
    end,
  },
}
