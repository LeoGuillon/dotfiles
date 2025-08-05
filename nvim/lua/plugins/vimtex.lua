return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- GENERAL SETTINGS

    -- syntax
    vim.g.vimtex_syntax_enabled = 0 -- we use treesitter’s syntax instead
    -- vim.g.vimtex_syntax_conceal_disable = 1 -- no need to conceal, I prefer to have the raw code at all time

    vim.g.vimtex_syntax_custom_cmds = {
      { name = "strong", argstyle = "bold" },
    }

    -- mappings
    vim.g.vimtex_mappings_enabled = 0 -- because I like tuning really precisely my config
    vim.g.vimtex_imaps_enabled = 0 -- because we use snippets to handle this better

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
      options = {
        "-pdflatex=lualatex",
        -- TODO: setup synctex
        -- TODO: setup “outputs” directory
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

    -- pdf viewing
    vim.g.vimtex_view_method = "general"
    -- TODO: setup sioyek viewing
    -- vim.g.vimtex_view_general_viewer = 'sioyek'
  end,
}
