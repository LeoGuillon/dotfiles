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
    run = "make install_jsregexp",
    config = function()
      local luasnip = require("luasnip")

      luasnip.setup({
        enable_autosnippets = true,
        store_selection_keys = "s",
        -- <Tab> is used for indent/deindent, for more consistency with normal and insert mode
      })

      -- keymaps
      local map = vim.keymap.set

      -- stylua: ignore start
      map({ "i" }, "<CR>", function() luasnip.expand() end, { silent = true })
      map({ "i", "s" }, "<Tab>", function() if luasnip.jumpable(1) then luasnip.jump(1) end end, { silent = true })
      map({ "i", "s" }, "<S-Tab>", function() if luasnip.jumpable(-1) then luasnip.jump(-1) end end, { silent = true })
      -- stylua: ignore end

      -- loads snippets from snippets folder
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "./snippets" },
      })
    end,
  },
  {
    "chrisgrieser/nvim-scissors",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      local scissors = require("scissors")

      scissors.setup({
        snippetDir = "./snippets",
        jsonFormatter = "jq",
        snippetSelection = {
          picker = "telescope",
          telescope = {
            alsoSearchSnippetBody = true,
          },
        },
      })

      -- keymaps
      local map = vim.keymap.set

      -- stylua: ignore start
      map("n", "<leader>se", function() scissors.editSnippet() end, { desc = "Snippet: Edit" })
      map({ "n", "x" }, "<leader>sa", function() scissors.addNewSnippet() end, { desc = "Snippet: Add" })
      -- stylua: ignore end

      require("which-key").add({ { "<leader>s", group = "Snippets…", icon = "" } })
    end,
  },
}
