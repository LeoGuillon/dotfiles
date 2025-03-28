return {
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "LudoPinelli/comment-box.nvim",
    -- TODO: setup this plugin
    config = function()
      local comment_box = require("comment-box")

      comment_box.setup({
        doc_width = 80,
        box_width = 60,
        line_width = 80, -- changing this value to have full-width lines
      })

      local map = vim.keymap.set

      -- we use the same command as Comment.nvim : gc + […]

      -- comment [b]ox, angular corners
      -- also in visual mode to allows to put the selection in a box
      map({ "n", "v" }, "gcb", function()
        comment_box.ccbox(2)
      end, { desc = "draws a comment Box" })

      -- [h]eader line, in rectangular brackets
      -- TODO: create the function that match exactly my need :
      -- a horizontal line, followed by a comment with just the title in brackets

      -- map("n", "gct", function()
      --   comment_box.llline(6)
      -- end, { desc = "draws a comment Title" })

      -- simple [l]ine
      map("n", "gcl", function()
        comment_box.cline(1)
      end, { desc = "draws a comment Line" })

      -- [d]elete the content of a box
      map({ "n", "v" }, "gcd", "<cmd>CBd<cr>", { desc = "Delete the content of a comment box" })

      -- [y]ank the content of a box
      map({ "n", "v" }, "gcy", "<cmd>CBy<cr>", { desc = "Changes the content of a comment box" })

      -- stylua: ignore end
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        -- custom keywords
        -- BUG: correct this
        QUES = {
          icon = " ",
          color = "info",
        },
      },
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
  },
}
