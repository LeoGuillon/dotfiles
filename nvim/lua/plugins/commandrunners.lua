return {
  -- Just
  {
    "chrisgrieser/nvim-justice",
    config = function()
      local justice = require("justice")

      justice.setup({
        keymaps = {
          -- ergo-L layout adapted quick jumps
          quickSelect = { "j", "n", "e", "s", "a" },
        },
      })

      -- keymap
      local map = vim.keymap.set
      map("n", "<leader>j", "<Cmd>Justice<CR>", { desc = "open Justice" })
    end,
  },
  -- Make
  -- TODO: configure a similar plugin, for Makefile
  -- {
  --   "Zeioth/makeit.nvim",
  --
  -- }
}
