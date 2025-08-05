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
    dependancies = { "neovim/lspconfig" },
    config = function()
      -- local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup({
        -- list of servers for mason to install
        -- list of available servers : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        ensure_installed = {
          -- "air", -- not sure to use this one
          "bashls",
          -- "clangd",
          "cssls",
          -- "css_variables",
          -- "html",
          -- "jsonls",
          -- "julials",
          -- "ltex-ls" -- grammar and spell checker for latex and md
          "lua_ls",
          -- "r-languageserver",
          -- "taplo", -- toml
          "texlab", -- latex lsp
          -- "ts_ls",
          "yamlls",
        },
        automatic_enable = true,

        -- handlers = {
        --   function(server_name)
        --     -- each lsp is called with its default config
        --     lspconfig[server_name].setup({})
        --   end,
        -- },
      })
    end,
  },
  -- LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependancies = {
      "hrsh7th/cmp-nvim-lsp", -- allows putting the LSP in autocompletion
      { "antosha417/nvim-lsp-file-operations", config = true }, -- adds code actions (intelligent renaming, refactoring, etc.)
      { "folke/lazydev.nvim", opts = {} }, -- useful for neovim config files
    },
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (KEYMAPS SETUP)

      local map = vim.keymap.set

      -- TODO: add relevant keymaps, and on buffer attach
      map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Display code actions" })
      map("n", "<leader>sd", "<cmd>Telescope lsp_definitions<CR>", { desc = "LSP Definitions" })
      map("n", "<leader>si", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP Implementations" })
      map("n", "<leader>sx", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "diagnostiX in buffer" })
      map("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, { desc = "Diagnostic" })
      map("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, { desc = "Diagnostic" })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (ERROR SIGNS SETUP)

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
          },
        },
      })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (LSPs SETUP)
      -- ────────────────────────────────────────────────────────────────────────────────

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (BASH)

      -- NOTE: configured to work also for zsh scripts

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (CSS)

      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (LUA)

      -- no need to setup, already done by the lazydev package
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (TEXLAB)

      -- latex lsp ; source : https://github.com/latex-lsp/texlab

      lspconfig.texlab.setup({
        capabilities = capabilities,
      })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (YAML)

      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
    end,
  },
}
