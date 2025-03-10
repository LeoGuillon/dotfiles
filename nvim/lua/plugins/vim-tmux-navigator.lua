return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
  },
  keys = {
    { "<C-Left>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to Left Window", silent = true, remap = true } },
    { "<C-Down>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to Down Window", silent = true, remap = true } },
    { "<C-Up>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to Up Window", silent = true, remap = true } },
    { "<C-Right>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to Right Window", silent = true, remap = true } },
  },
}
