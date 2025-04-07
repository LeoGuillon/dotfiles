return {
  -- mason-tool-installer
  -- for formatters and linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "black", -- python
          "clang-format", -- c, c++
          -- "jupytext", -- julia, R, Rmd
          "prettier", -- html, css, scss, md, javascript, typescript, json
          "stylua", -- lua
          -- "taplo", -- toml
          "tex-fmt", -- latex
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          bib = { "tex-fmt" },
          c = { "clang-format" },
          cpp = { "clang-format" },
          css = { "prettier" },
          javascript = { "prettier" },
          json = { "jq" },
          -- julia = { "jupytext" },
          html = { "prettier" },
          lua = { "stylua" },
          markdown = { "prettier" },
          -- python = { "jupytext" },
          -- r = { "jupytext" },
          -- rmd = { "jupytext" },
          scss = { "prettier" },
          sty = { "tex-fmt" },
          tex = { "tex-fmt" },
          -- toml = { "taplo" }, -- waiting to configure taplo properly
          typescript = { "prettier" },
          yaml = { "prettier" },
        },
        formatters = {
          ["tex-fmt"] = {
            command = "tex-fmt",
            prepend_args = { "--nowrap" },
          },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        conform.format({
          lsp_format = "fallback",
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
}
