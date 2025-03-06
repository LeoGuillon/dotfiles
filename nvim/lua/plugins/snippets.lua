return {
  {
    "L3mon4d3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "./snippets" },
      })
    end,
  },
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = "./snippets",
    },
    config = function()
      -- keymaps
      local map = vim.keymap.set
      map("n", "<leader>se", function()
        require("scissors").editSnippet()
      end, { desc = "Snippet: Edit" })
      map({ "n", "x" }, "<leader>sa", function()
        require("scissors").addNewSnippet()
      end, { desc = "Snippet: Add" })
    end,
  },
}
