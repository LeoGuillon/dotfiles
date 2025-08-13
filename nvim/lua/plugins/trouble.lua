return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  config = function()
    local map = require("core.utils").map

    -- -- stylua: ignore start
    -- map("n", "<leader>tx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostiXs" })
    -- map("n", "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "diagnostiXs for current buffer" })
    -- -- stylua: ignore end
  end,
}
