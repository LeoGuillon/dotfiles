return {
	{
		"numToStr/Comment.nvim",
		opts = {},
		config = function()
			local ft = require("Comment.ft")

			ft.set("tex", "% %s")
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
