return {
  "monaqa/dial.nvim",
  config = function()
    local dial = require("dial.config")

    -- keymaps
    local map = vim.keymap.set

    -- stylua: ignore
    -- todo: configure the differents increments functions
    -- map("n", "+", function()
    --   dial.manipulate("increment", "normal")
    -- end, { desc = "Increment under cursor" })
    -- map("n", "-", function()
    --   dial.manipulate("decrement", "normal")
    -- end, { desc = "Decrement under cursor" })
    -- map("n", "g+", function()
    --   dial.manipulate("increment", "gnormal")
    -- end, { desc = "Increment under cursor" })
    -- map("n", "g-", function()
    --   dial.manipulate("decrement", "gnormal")
    -- end, { desc = "Decrement under cursor" })
    -- map("v", "+", function()
    --   dial.manipulate("increment", "visual")
    -- end, { desc = "Increment under cursor" })
    -- map("v", "-", function()
    --   dial.manipulate("decrement", "visual")
    -- end, { desc = "Decrement under cursor" })
    -- map("v", "g+", function()
    --   dial.manipulate("increment", "gvisual")
    -- end, { desc = "Increment under cursor" })
    -- map("v", "g-", function()
    --   dial.manipulate("decrement", "gvisual")
    -- end, { desc = "Decrement under cursor" })
  end,
}
