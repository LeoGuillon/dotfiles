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
      local ls = require("luasnip")

      ls.setup({
        enable_autosnippets = true,
        -- store_selection_keys = "<tab>",
      })

      -- keymaps
      local map = vim.keymap.set

      -- stylua: ignore start
      map({ "i" }, "<cr>", function() ls.expand() end, { silent = true })
      -- stylua: ignore end

      -- jumps between tabstops
      map({ "i", "s" }, "<Tab>", function()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end, { silent = true })

      map({ "i", "s" }, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

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
    opts = {
      snippetDir = "./snippets",
    },
    config = function()
      -- keymaps
      local map = vim.keymap.set

      -- stylua: ignore start
      map("n", "<leader>se", function() require("scissors").editSnippet() end, { desc = "Snippet: Edit" })
      map({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end, { desc = "Snippet: Add" })
      -- stylua: ignore end

      require("which-key").add({ { "<leader>s", group = "Snippets…", icon = "" } })
    end,
  },
}
