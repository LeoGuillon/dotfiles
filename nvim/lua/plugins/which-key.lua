return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",

    win = {
      title = false,
    }
    ,
    -- sorting is done by alphabetical order, to see available keys faster
    sort = {
      "alphanum",
      "mod",
    },
    -- supplementary or missing default mappings
    spec = {
      { "a", desc = "Insert after cursor" },
      { "A", desc = "Insert at end of line" },
      { "i", desc = "Insert before cursor" },
      { "I", desc = "Insert at first-non blank character" },
      { "m", desc = "Add mark" },
      { "o", desc = "Insert a new line below" },
      { "O", desc = "Insert a new line above" },
      { "p", desc = "Paste after cursor" },
      { "q", desc = "Record macro" },
      { "s", desc = "Substitute character under cursor" },
      { "S", desc = "Substitute line" },
      { "u", desc = "Undo" },
      { "z", desc = "folds etc." },
      { "[", desc = "previous" },
      { "]", desc = "next" },

      { "<leader>", group = "Leader key" },
    },
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
