return {
  "chrisgrieser/nvim-recorder",
  opts = {},
  config = function()
    require("recorder").setup({
      slots = { "c", "o" }, -- default registers, closest letters from Q in ergo-l layout
      clear = true,
      useNerdFontIcons = true,
    })
  end,
}
