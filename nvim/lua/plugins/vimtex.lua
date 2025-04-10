return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- GENERAL SETTINGS

    vim.g.vimtex_syntax_enabled = 0 -- we use treesitter’s syntax instead

    -- mappings
    vim.g.vimtex_mappings_enabled = 0 -- because I like tuning really precisely my config
    vim.g.vimtex_imaps_enabled = 0 -- because we use snippets to handle this better

    -- compilation
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-pdflatex=lualatex",
      },
    }
    -- pdf viewing
    vim.g.vimtex_view_method = "general"
    -- vim.g.vimtex_view_general_viewer = "mupdf-gl"
    -- vim.g.vimtex_view_general_options = "@pdf"
  end,
}
