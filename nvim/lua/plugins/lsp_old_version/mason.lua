return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  keys = {
    { "<leader>M", "<cmd>Mason<cr>", desc = "Open Mason" },
  },
  config = function()
    -- import configs
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason_lspconfig.setup({
      -- list of servers for mason to install
      -- list of available servers : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      ensure_installed = {
        -- "bashls",
        -- "clangd",
        -- "cssls",
        -- "html",
        -- "jsonls",
        -- "julials",
        -- "texlab",
        "lua_ls",
        -- "pylsp",
        -- "r_language_server",
        -- "sqlls",
        -- "taplo", -- toml
        -- "ts_ls",
        -- "yamlls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- "clang-format", -- c, c++
        -- "jupytext", -- python, julia, R, Rmd
        "prettier", -- html, css, scss, md, javascript, typescript, json, yaml, toml
        "stylua", -- lua
        "tex-fmt", -- latex
      },
    })
  end,
}
