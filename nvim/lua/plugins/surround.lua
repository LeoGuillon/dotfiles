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
        ["v"] = ">", -- che[v]rons
        ["V"] = "<",
      }
    })
  end
}
