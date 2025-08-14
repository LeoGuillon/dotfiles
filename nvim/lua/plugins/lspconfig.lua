return {
  -- LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependancies = {
      { "antosha417/nvim-lsp-file-operations", config = true }, -- adds code actions (intelligent renaming, refactoring, etc.)
      { "folke/lazydev.nvim", opts = {} }, -- useful for neovim config files
    },
    config = function()
      -- ────────────────────────────────────────────────────────────────────────────────
      -- (KEYMAPS SETUP)
      -- ────────────────────────────────────────────────────────────────────────────────

      local map = require("core.utils").map

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (GO TO…)

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

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (DIAGNOSTICS)
      -- TODO: configure properly diagnostics shortcuts between lspconfig and trouble.nvim
      -- map("n", "<leader>sx", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "diagnostiX in buffer" })
      -- map("n", "<leader>xx", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

      -- stylua: ignore start
      map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Diagnostic" })
      map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Diagnostic" })
      -- stylua: ignore end

      -- ────────────────────────────────────────────────────────────────────────────────
      -- General LSP management

      require("which-key").add({ { "<leader>l", group = "LSP…", icon = "" } })
      map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
      map("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart" })
      map("n", "<leader>ls", "<cmd>LspStop<cr>", { desc = "Stop" })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (DIAGNOSTICS SETUP)
      -- ────────────────────────────────────────────────────────────────────────────────

      -- for more infos : vim.diagnostic.Opts
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { -- creates virtual text at the end of lines with diagnostics
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        virtual_lines = false, -- creates virtual lines under diagnostics
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

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (JSON)

      vim.lsp.config("jsonls", {
        settings = {
          json = {
            validate = { enable = true },
          },
        },
      })

      -- ────────────────────────────────────────────────────────────────────────────────
      -- (R)

      vim.lsp.config("r_language_server", {
        cmd = { "R", "--slave", "-e", "languageserver::run()" },
        settings = {
          r = {
            lsp = {
              diagnostics = false,
              rich_documentation = true,
            },
          },
        },
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
