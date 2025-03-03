return {
  "stevearc/conform.nvim",
  opts = {},
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        css = { "prettier" },
        javascript = { "prettier" },
        json = { "prettier" },
        julia = { "jupytext" },
        html = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "jupytext" },
        r = { "jupytext" },
        rmd = { "jupytext" },
        scss = { "prettier" },
        sty = { "tex-fmt" },
        tex = { "tex-fmt" },
        toml = { "prettier" },
        typescript = { "prettier" },
        yaml = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    -- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    --   conform.format({
    --     lsp_format = "fallback",
    --     async = false,
    --     timeout_ms = 1000,
    --   })
    -- end, { desc = "Format file or range (in visual mode)" })
  end,
}
