return {
  "catppuccin/nvim", 
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        -- bufferline = true, -- special assignment
        -- gitsigns = true,
        indent_blankline = {
          enabled = true,
          scope_color = "",
          colored_indent_levels = false,
        },
        -- mason = true,
        nvimtree = true,
        nvim_surround = true,
        treesitter = true,
        rainbow_delimiters = true,
        -- snacks = {
        --   enabled = false,
        --   indent_scope_color = "",
        -- }
        telescope = { enabled = true },
        which_key = true,
      }
    })

    vim.cmd.colorscheme "catppuccin"
  end,
}
