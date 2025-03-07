return {
  "lewis6991/gitsigns.nvim",
  dependancies = {
    "folke/which-key.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {

    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions
      map("n", "<leader>ghs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>ghr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>ghs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      map("v", "<leader>ghr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")

      map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")

      map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")

      map("n", "<leader>gd", gs.diffthis, "Diff this")
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      -- Text object
      map({ "o", "x" }, "ioh", "<cmd>Gitsigns select_hunk<CR>", "Gitsigns select hunk")

      require("which-key").add({ { "<leader>g", group = "Git…" } })
      require("which-key").add({ { "<leader>gh", group = "Git hunks…" } })
    end,
  },
}
