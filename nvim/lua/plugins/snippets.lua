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

      -- stylua: ignore start
      -- vim.keymap.set({ "i" }, "<tab>", function() ls.expand() end, { silent = true })
      -- vim.keymap.set({ "i", "s" }, "<tab>", function() ls.jump(1) end, { silent = true })
      -- vim.keymap.set({ "i", "s" }, "<s-tab>", function() ls.jump(-1) end, { silent = true })
      -- stylua: ignore end

      -- vim.keymap.set({ "i", "s" }, "<C-E>", function()
      --   if ls.choice_active() then
      --     ls.change_choice(1)
      --   end
      -- end, { silent = true })

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
