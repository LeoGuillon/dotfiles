return {
  "lukas-reineke/indent-blankline.nvim",
  event = "UIEnter",
  main = "ibl",
  -- TODO: sync it with catppuccin and rainbow-delimiters
  opts = {},
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = {
          "dashboard",
        },
      },
    })
  end,
}
