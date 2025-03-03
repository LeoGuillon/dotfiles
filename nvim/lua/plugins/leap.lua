return {
  "ggandor/leap.nvim",
  vim.keymap.set({ "n", "x", "o" }, "l", "<Plug>(leap-forward)", { desc = "Leap forward" }),
  vim.keymap.set({ "n", "x", "o" }, "L", "<Plug>(leap-backward)", { desc = "Leap backwards" }),
  vim.keymap.set({ "n", "x", "o" }, "gl", "<Plug>(leap-from-window)", { desc = "Leap from window" }),
}
