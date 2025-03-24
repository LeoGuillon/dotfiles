return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      aliases = {
        ["b"] = ")", -- [b]rackets
        ["B"] = "(",
        ["c"] = "}", -- [c]urly braces
        ["C"] = "{",
        ["r"] = "]", -- [r]ectangular brackets
        ["R"] = "[",
        ["q"] = '"', -- [q]uoted text
        ["a"] = "'", -- [a]postrothe quoted text
        ["i"] = "`", -- [i]nline code
        -- TODO: add guillemets support
        -- ["g"] = "»", -- french [g]uillemets
        -- ["G"] = "«",
        ["v"] = ">", -- che[v]rons
        ["V"] = "<",
        -- TODO: complete LaTeX surrounding support,
        -- notably with vimtex package
        ["m"] = "$", -- [m]ath block, for LaTeX
      },
    })
  end,
}
