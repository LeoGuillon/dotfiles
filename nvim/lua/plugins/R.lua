return {
  "R-nvim/R.nvim",
  lazy = false,
  config = function()
    local opts = {
      auto_start = "always", -- always start running the plugin when opening an R file
      user_maps_only = true,
    }

    require("r").setup(opts)
  end,
}
