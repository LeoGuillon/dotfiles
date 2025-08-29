return {
  "R-nvim/R.nvim",
  lazy = false,
  config = function()
    local opts = {
      user_maps_only = true,
    }

    require("r").setup(opts)
  end,
}
