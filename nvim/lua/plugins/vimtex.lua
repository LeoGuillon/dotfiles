return {
	"lervag/vimtex",
	ft = "tex", -- lazy-load only when entering tex files
	init = function()
		-- GENERAL SETTINGS

		-- syntax
		vim.g.vimtex_syntax_conceal_disable = 1 -- no need to conceal, I prefer to have the raw code at all time
		vim.g.vimtex_syntax_custom_cmds = {
			{
				name = "strong",
				opt = false,
				argstyle = "bold",
			},
			{
				name = "mathbb",
				opt = false,
				mathmode = 1,
				argstyle = "bold",
			},
			{
				name = "mathcal",
				opt = false,
				mathmode = 1,
				argstyle = "ital",
			},
			{
				name = "mathbi",
				opt = false,
				mathmode = 1,
				argstyle = "boldital",
			},
			{
				name = "mathset",
				opt = false,
				mathmode = 1,
				argstyle = "bold",
			},
		}

		-- mappings
		vim.g.vimtex_mappings_enabled = 0 -- because I like tuning really precisely my config
		vim.g.vimtex_imaps_enabled = 0 -- because we use snippets to handle this better

		vim.g.vimtex_env_toggle_math_map = {
			["\\("] = "\\[",
			["\\["] = "equation",
			["equation"] = "align",
			["align"] = "\\[",
			["$"] = "\\(",
			["$$"] = "\\[",
		}

		vim.g.vimtex_toggle_fractions = {
			["INLINE"] = "frac",
			["frac"] = "dfrac",
			["dfrac"] = "INLINE",
		}

		-- table of contents
		vim.g.vimtex_toc_config = {
			hotkeys_enabled = 1,
			hotkeys_leader = "",
			layers = { "content" },
			show_help = 0,
			split_pos = "full",
		}

		-- compilation
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "aux",
			-- out_dir = "outputs",
			options = {
				"-pdflatex=lualatex",
				"-synctex=1",
			},
		}

		-- warnings and errors filtering
		vim.g.vimtex_quickfix_open_on_warning = 0
		vim.g.vimtex_quickfix_ignore_filters = {
			"Underfull ",
			"Overfull ",
			"LaTeX Warning: Unused global option(s):",
			"Package unicode-math Warning: Using ",
			"Package unicode-math Warning: I'm going to overwrite the following commands",
		}
		vim.g.vimtex_log_ignore = { -- Suppress specific log messages
			"Underfull",
			"Overfull",
			"specifier changed to",
			"Token not allowed in a PDF string",
		}

		-- pdf viewing
		vim.g.vimtex_view_method = "sioyek"
		-- vim.g.vimtex_view_sioyek_options = …
	end,
}
