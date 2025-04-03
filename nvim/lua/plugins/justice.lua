return {
  "chrisgrieser/nvim-justice",
  config = function()
    local justice = require("justice")

    justice.setup({
      keymaps = {
        -- ergo-L layout adapted quick jumps
        quickSelect = { "n", "e", "s", "a" },
      },
    })

    -- keymap
    local map = vim.keymap.set
    map("n", "<leader>j", "<Cmd>Justice<CR>", { desc = "open Justice" })
  end,
}
