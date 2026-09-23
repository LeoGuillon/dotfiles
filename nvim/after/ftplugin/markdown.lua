vim.opt_local.wrap = true -- enable wrap lines for tex files
vim.opt_local.linebreak = true -- wrap on words instead of characters

vim.opt_local.number = false
vim.opt_local.relativenumber = false

-- ──────────────────────────────────────────────────────────────────────────────
-- CUSTOM SURROUNDS
-- ──────────────────────────────────────────────────────────────────────────────

require("nvim-surround").buffer_setup({
	surrounds = {
		["*"] = { -- italic
			add = { "*", "*" },
			find = "%*.-%*",
			delete = "^(%*)().-(%)()$",
		},
		["×"] = { -- bold
			add = { "**", "**" },
			find = "%*%*.-%*%*",
			delete = "^(%*%*)().-(%*%*)()$",
		},
		-- TODO: add the codeblock surround
		["~"] = { -- strikethrough
			add = { "~~", "~~" },
			find = "~~.-~~",
			delete = "^(~~)().-(~~)()$",
		},
		["u"] = { -- [u]rl
			add = function()
				local url = vim.fn.input("URL: ")
				return { { "[", "](" .. url .. ")" } }
			end,
		},
	},
	aliases = {
		["B"] = "×",
		["I"] = "*",
		["S"] = "~",
	},
})
