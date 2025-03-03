return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- TODO: customize colors to fit catppuccin theme
  },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local map = vim.keymap.set -- for conciseness

    map("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    map("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
