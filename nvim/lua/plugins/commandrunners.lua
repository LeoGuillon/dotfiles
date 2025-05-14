return {
  -- Just
  {
    "chrisgrieser/nvim-justice",
    config = function()
      local justice = require("justice")

      justice.setup({})

      -- keymap
      local map = vim.keymap.set
      map("n", "<leader>j", "<cmd>Justice<cr>", { desc = "Justice" })
      map("n", "<leader>oj", "<cmd>Justice<cr>", { desc = "Justice" })
    end,
  },
  -- Make
  -- TODO: configure a similar plugin, for Makefile
  -- {
  --   "Zeioth/makeit.nvim",
  --
  -- }
}
