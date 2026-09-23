return {
	"chrisgrieser/nvim-spider",
	keys = {
    -- stylua: ignore start
    { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "next [w]ord" },
    { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "next [e]nd of word" },
    { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "previous word ([b]ackwards)" },
    { "l", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "previous end of word ([l]ean back)" },
		-- stylua: ignore end
	},
}
