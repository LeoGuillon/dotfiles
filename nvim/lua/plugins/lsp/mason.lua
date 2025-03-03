return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import configs
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      -- list of available servers : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "html",
        "jsonls",
        "julials",
        "texlab",
        "lua_ls",
        "pylsp",
        "r_language_server",
        "sqlls",
        "taplo", -- toml
        "ts_ls",
        "yamlls",
      },

      handlers = {
        function(server_name)
          -- each lsp is called with its default config
          lspconfig[server_name].setup({})
        end,

        -- then, each lsp can be configured as wanted
        -- for example configs : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

        lua_ls = function()
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
        end,
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "clang-format", -- c, c++
        "jupytext", -- python, julia, R, Rmd
        "prettier", -- html, css, scss, md, javascript, typescript
        "stylua", -- lua
        "tex-fmt", -- latex
      },
    })
  end,
}
