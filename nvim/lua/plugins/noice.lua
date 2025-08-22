return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependancies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      local noice = require("noice")
      local icons = require("core.utils").icons

      noice.setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          opts = {},
          format = {
            cmdline = {
              title = "Cmdline",
              pattern = "^:",
              icon = "",
              lang = "vim",
            },
            search_down = {
              kind = "search",
              pattern = "^/",
              icon = "󰍉 󰄼",
              lang = "regex",
            },
            -- BUG: fix the upward search
            search_up = {
              kind = "search",
              pattern = "^\\",
              icon = "󰍉 󰄿",
              lang = "regex",
            },
            help = { icon = "?" },
            set = {
              pattern = { "^:%s*set%s+" },
              icon = "",
            },
            checkhealth = {
              pattern = { "^:%s*checkhealth%s+" },
              icon = icons.ui.checkhealth,
            },
          },
        },
        lsp = {
          -- override markdwon rendering so that
          -- cmp and other plugins use Treesitter parser instead
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false, -- nb: requires nvim-cmp
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          lsp_doc_border = true,
        },
      })

      local map = require("core.utils").map

      require("which-key").add({ { "<leader>n", group = "Noice…", icon = "󰍡" } })
      map("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "last" })

      map("n", "<leader>sn", "<cmd>Noice telescope<cr>", { desc = "Noice messages" })
    end,
  },
}
