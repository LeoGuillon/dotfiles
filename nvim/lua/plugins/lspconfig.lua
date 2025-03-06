return {
  -- MASON
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>M", "<cmd>Mason<cr>", desc = "Open Mason" },
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
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- list of servers for mason to install
        -- list of available servers : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        ensure_installed = {
          -- "bashls",
          -- "clangd",
          -- "cssls",
          -- "css_variables",
          -- "html",
          -- "jsonls",
          -- "julials",
          -- "ltex-ls" -- grammar and spell checker for latex and md
          "lua_ls",
          -- "pyright",
          -- "r_language_server",
          -- "taplo", -- toml
          "texlab", -- latex lsp
          -- "ts_ls",
          -- "yamlls",
        },
      })
    end,
  },
  -- LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- then, each lsp can be configured as wanted
      -- for example configs : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- forces the lsp to recognize the `vim` global
              -- credits : https://vincent.jousse.org/blog/fr/tech/configurer-neovim-comme-ide-a-partir-de-zero-tutoriel-guide/#mise-en-place-de-lautocompletion-avec-nvim-cmp
              globals = { "vim" },
            },
          },
        },
      })
      lspconfig.texlab.setup({})

      -- keymaps setup
      local map = vim.keymap.set

      map("n", "gh", vim.lsp.buf.hover, { desc = "Display hover" })
      map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Display code actions" })
    end,
  },
}
