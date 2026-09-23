return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local map = require("core.utils").map

			map("n", "<leader>ot", "<cmd>InspectTree<cr>", { desc = "[t]reesitter" })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true,
				},
			})

			-- ──────────────────────────────────────────────────────────────────────────────
			-- (KEYMAPS)

			local map = require("core.utils").map
			local wk = require("which-key")
			local treesitter_icon = require("core.utils").icons.ui.treesitter

			wk.add({ { "io", group = "treesitter text[o]bject…", mode = { "x", "o" }, icon = treesitter_icon } })
			wk.add({ { "ao", group = "treesitter text[o]bject…", mode = { "x", "o" }, icon = treesitter_icon } })

			local textobjects = {
				-- TODO: find a way to map @assignement.lhs/rhs
				{ "a", "assignement", "[a]ssignment" },
				{ "b", "block", "[b]lock" },
				{ "c", "class", "[c]lass" },
				{ "d", "function", "function [d]efinition" },
				{ "f", "call", "[f]unction call" },
				{ "gc", "comment", "[c]omment" },
				{ "i", "conditional", "[i]f-else" },
				{ "l", "loop", "[l]oop" },
				{ "p", "parameter", "function [p]arameter" },
				{ "r", "return", "function [r]eturn" },
				{ "x", "regex", "rege[x]" },
				-- TODO: other textobjects to add :
				-- - attribute (probably relevant only for C++)
				-- - number (only inner available)
			}

			local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject

			-- TODO: implement jumps, cf. https://github.com/nvim-treesitter/nvim-treesitter-textobjects

			for _, value in pairs(textobjects) do
				local keymap, object, desc = unpack(value)
				local prepend_keymap = "o"
				if object == "comment" then
					prepend_keymap = ""
				end
				map({ "x", "o" }, "i" .. prepend_keymap .. keymap, function()
					select_textobject("@" .. object .. ".inner", "textobjects")
				end, { desc = desc })
				map({ "x", "o" }, "a" .. prepend_keymap .. keymap, function()
					select_textobject("@" .. object .. ".outer", "textobjects")
				end, { desc = desc })
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			local map = require("core.utils").map
			map("n", "[c", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { desc = "treesitter [c]ontext", silent = true })
		end,
	},
}
