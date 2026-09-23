return {
	"lukas-reineke/indent-blankline.nvim",
	event = "UIEnter",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		})
	end,
}
