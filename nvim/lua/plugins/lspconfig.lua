return {
	-- LSPCONFIG
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependancies = {
			{ "antosha417/nvim-lsp-file-operations", config = true }, -- adds code actions (intelligent renaming, refactoring, etc.)
			{ "folke/lazydev.nvim", opts = {} }, -- useful for neovim config files
		},
		config = function()
			-- TODO: setup so that keymaps loads when a LSP is attached to a buffer

			-- ────────────────────────────────────────────────────────────────────────────────
			-- (KEYMAPS SETUP)
			-- ────────────────────────────────────────────────────────────────────────────────

			local map = require("core.utils").map
			local icons = require("core.utils").icons

			-- ──────────────────────────────────────────────────────────────────────────────
			-- (HOVER DOCUMENTATION)

			map("n", "K", function()
				vim.lsp.buf.hover({ border = "single", max_height = 25, max_width = 120 })
			end, { desc = "[h]over documentation under cursor" })

			-- ────────────────────────────────────────────────────────────────────────────────
			-- (GO TO…)

			-- delete default LSPs commands : vim.lsp.buf.…
			vim.keymap.del("n", "gO") -- document symbols
			vim.keymap.del("n", "gra") -- code_action
			vim.keymap.del("n", "gri") -- implementations
			vim.keymap.del("n", "grn") -- smart rename
			vim.keymap.del("n", "grr") -- references
			vim.keymap.del("n", "grt") -- type_definition
			vim.keymap.del("n", "grx") -- vim.lsp.codelens.run

			map("n", "gd", vim.lsp.buf.definition, { desc = "[g]o to [d]efinition" })
			map("n", "gD", vim.lsp.buf.declaration, { desc = "[g]o to [D]eclaration" })
			map("n", "gI", vim.lsp.buf.implementation, { desc = "[g]o to [I]mplementations" })

			require("which-key").add({ { "gl", group = "[L]SP…", icon = icons.ui.lsp } })
			map("n", "gla", vim.lsp.buf.code_action, { desc = "code [a]ctions" })
			map("n", "gln", vim.lsp.buf.rename, { desc = "re[n]ame" })

			-- ──────────────────────────────────────────────────────────────────────────────
			-- Telescope + LSP = <3

			require("which-key").add({ { "<leader>sl", group = "[L]SP…", icon = icons.ui.lsp } })
			map("n", "<leader>sld", require("telescope.builtin").lsp_definitions, { desc = "[d]efinitions" })
			map("n", "<leader>sli", require("telescope.builtin").lsp_implementations, { desc = "[i]mplementations" })
			map("n", "<leader>slr", require("telescope.builtin").lsp_references, { desc = "[r]eferences" })
			map("n", "<leader>sls", require("telescope.builtin").lsp_document_symbols, { desc = "document Symbols" })
			map("n", "<leader>slS", require("telescope.builtin").lsp_workspace_symbols, { desc = "document Symbols" })
			map("n", "<leader>sld", require("telescope.builtin").lsp_type_definitions, { desc = "[t]ype definitions" })

			-- ────────────────────────────────────────────────────────────────────────────────
			-- (DIAGNOSTICS)

			map("n", "<leader>sx", require("telescope.builtin").diagnostics, { desc = "diagnosti[x]s in buffers" })

      -- stylua: ignore start
      map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Diagnostic" })
      map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Diagnostic" })
			-- stylua: ignore end

			-- ────────────────────────────────────────────────────────────────────────────────
			-- General LSP management

			require("which-key").add({ { "<leader>l", group = "LSP…", icon = "" } })
			map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
			map("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart" })
			map("n", "<leader>ls", "<cmd>LspStop<cr>", { desc = "Stop" })

			-- ────────────────────────────────────────────────────────────────────────────────
			-- (DIAGNOSTICS SETUP)
			-- ────────────────────────────────────────────────────────────────────────────────

			-- for more infos : vim.diagnostic.Opts
			vim.diagnostic.config({
				underline = true,
				update_in_insert = false,
				virtual_text = { -- creates virtual text at the end of lines with diagnostics
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				virtual_lines = false, -- creates virtual lines under diagnostics
				severity_sor = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
						[vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
						[vim.diagnostic.severity.INFO] = icons.diagnostics.info,
						[vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
					},
				},
			})

			-- ────────────────────────────────────────────────────────────────────────────────
			-- (LSPs SETUP)
			-- ────────────────────────────────────────────────────────────────────────────────

			-- ──────────────────────────────────────────────────────────────────────────────
			-- (CLANGD)

			-- TODO: worth it to setup clangd LSP ?

			-- ────────────────────────────────────────────────────────────────────────────────
			-- (JSON)

			vim.lsp.config("jsonls", {
				settings = {
					json = {
						validate = { enable = true },
					},
				},
			})

			-- ──────────────────────────────────────────────────────────────────────────────
			-- (VIMLS)

			vim.lsp.config("vimls", {
				settings = {
					vim = {
						lsp = {
							diagnostics = false,
						},
					},
				},
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
