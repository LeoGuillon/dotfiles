return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    -- GENERAL SETTINGS

    vim.g.vimtex_syntax_enabled = 0 -- already handled by treesitter

    -- mappings
    vim.g.vimtex_mappings_enabled = 0 -- disables all default mappings
    -- because I like tuning really precisely my config
    vim.g.vimtex_imaps_enabled = 0 -- disables all insert mode mappings
    -- because we use snippets to handle this better

    -- compilation
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk_engines = { "lualatex" }

    -- pdf viewing
    -- TODO: configure a proper and compatible pdf viewer
    -- vim.g.vimtex_view_method = 'zathura'
  end,
}
