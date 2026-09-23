return {
	{
		"chrisgrieser/nvim-justice",
		config = function()
			local justice = require("justice")

			justice.setup({})

			-- keymap
			local map = vim.keymap.set
			map("n", "<leader>j", "<cmd>Justice<cr>", { desc = "[j]ustice" })
			map("n", "<leader>oj", "<cmd>Justice<cr>", { desc = "[j]ustice" })
		end,
	},
}
