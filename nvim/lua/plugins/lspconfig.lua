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

      local map = require("core.utils").map

      map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
      map("n", "gI", vim.lsp.buf.implementation, { desc = "Go to Implementations" })
      map("n", "gh", vim.lsp.buf.hover, { desc = "Hover documentation under cursor" })

      -- TODO: finish configure LSP keymaps

      map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Display code actions" })

      -- Telescope + LSP = <3
      require("which-key").add({ { "<leader>sl", group = "LSP…", icon = "" } })
      map("n", "<leader>sld", "<cmd>Telescope lsp_definitions<CR>", { desc = "Definitions" })
      map("n", "<leader>sli", "<cmd>Telescope lsp_implementations<CR>", { desc = "Implementations" })
      map("n", "<leader>slr", "<cmd>Telescope lsp_references<CR>", { desc = "References" })
      map("n", "<leader>slt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Type definitions" })

      -- Diagnostics
      -- TODO: configure properly diagnostics shortcuts between lspconfig and trouble.nvim
      -- map("n", "<leader>sx", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "diagnostiX in buffer" })
      -- map("n", "<leader>xx", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

      -- stylua: ignore start
      map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Diagnostic" })
      map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Diagnostic" })
      -- stylua: ignore end

      -- General LSP management
      require("which-key").add({ { "<leader>l", group = "LSP…", icon = "" } })
      map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
      map("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart" })
      map("n", "<leader>ls", "<cmd>LspStop<cr>", { desc = "Stop" })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (DIAGNOSTICS SETUP)

      -- for more infos : vim.diagnostic.Opts
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sor = true,
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

      -- TODO: setup properly each lsp within separated files,
      -- with a detailed setup for each languageserver adapted to my own use

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (BASH)

      -- configured to work also for zsh scripts
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
