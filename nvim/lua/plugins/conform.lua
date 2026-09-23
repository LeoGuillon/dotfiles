return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				bib = { "tex-fmt" },
				c = { "clang-format" },
				cls = { "tex-fmt" },
				cpp = { "clang-format" },
				css = { "prettier" },
				-- javascript = { "prettier" },
				json = { "jq" },
				-- julia = { "jupytext" },
				-- html = { "prettier" },
				lua = { "stylua" },
				-- BUG: correct
				-- make = { "mbake" },
				markdown = { "prettier" },
				-- python = { "ruff" },
				-- r = { "air" },
				-- rmd = { "jupytext" },
				-- scss = { "prettier" },
				sh = { "shfmt" },
				sty = { "tex-fmt" },
				tex = { "tex-fmt" },
				-- toml = { "taplo" }, -- waiting to configure taplo properly
				typescript = { "prettier" },
				yaml = { "prettier" },
			},
			-- formatters-specific options
			formatters = {
				-- docs : https://clang.llvm.org/docs/ClangFormatStyleOptions.html
				["clang"] = {
					prepend_args = {},
				},
				["tex-fmt"] = {
					command = "tex-fmt",
					prepend_args = { "--nowrap" },
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})

		local map = require("core.utils").map

		require("which-key").add({ { "<leader>f", group = "[f]ormat…", icon = "" } })

		map({ "n", "v" }, "<leader>ff", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "[f]ormat file or range (in visual mode)" })
		map("n", "<leader>fi", "<cmd>ConformInfo<cr>", { desc = "[i]nfos on current active formatters" })
		map("n", "<leader>oc", "<cmd>ConformInfo<cr>", { desc = "[c]onform" })
	end,
}
