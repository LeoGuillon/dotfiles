return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
  },
  keys = {
    { "<C-Left>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to Left Window", silent = true, noremap = true } },
    { "<C-Down>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to Down Window", silent = true, noremap = true } },
    { "<C-Up>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to Up Window", silent = true, noremap = true } },
    { "<C-Right>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to Right Window", silent = true, noremap = true } },
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1 -- to prevent to collision of <C-h> with my mapping of splitting
  end,
}
