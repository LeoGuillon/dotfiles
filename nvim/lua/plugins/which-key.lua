return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependancies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    preset = "modern",
    win = {
      no_overlap = true, -- allows to overlap with the cursor
      title = false,
    },
    -- sorting is done by alphabetical order, to see available keys faster
    sort = {
      "alphanum",
      "mod",
    },
    -- supplementary or missing default mappings
    spec = {
      { "a", desc = "Append after cursor" },
      { "A", desc = "Append at end of line" },
      { "f", desc = "Find next occurence in line", mode = { "n", "o", "x" } },
      { "F", desc = "Find previous occurence in line", mode = { "n", "o", "x" } },
      { "i", desc = "Insert before cursor" },
      { "I", desc = "Insert at first-non blank character" },
      { "m", desc = "add Mark" },
      { "o", desc = "Open a new line below" },
      { "O", desc = "Open a new line above" },
      { "p", desc = "Paste after cursor" },
      { "q", desc = "reQord macro" },
      { "R", desc = "Replace mode" },
      { "s", desc = "Substitute character under cursor" },
      { "S", desc = "Substitute line" },
      { "t", desc = "move Towards next occurence in line", mode = { "n", "o", "x" } },
      { "T", desc = "move Towards previous occurence in line", mode = { "n", "o", "x" } },
      { "u", desc = "Undo" },
      { "z", desc = "foldZ etc. …" },
      { "[", desc = "previous…" },
      { "]", desc = "next…" },

      -- leader groups and subgroups
      { "<leader>", group = "Leader key" },
      { "<leader>c", group = "Code actions…" },
      { "<leader>o", group = "Open…" },
      { "<leader>t", group = "Toggle…" },
      { "<localleader>", group = "Local Leader key…" },
    },
  },
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    group = "",
    -- TODO: check the default rules to icons assignment, and define our own
    rules = {},
  },
  keys = {
    {
      "?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Which-key display",
    },
  },
}
