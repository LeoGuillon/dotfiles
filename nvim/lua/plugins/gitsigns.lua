return {
  {
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
      -- stylua: ignore start

      -- hunk manipulation
      map("n", "<leader>ghs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>ghr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>ghs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
      map("v", "<leader>ghr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
      map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>ghi", gs.preview_hunk_inline, "preview hunk Inline")

      map("n", "<leader>gs", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
      map("n", "<leader>gd", gs.diffthis, "Diff buffer")



      -- map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff this ~") -- TODO: check what this changes

      -- Text object
      map({ "o", "x" }, "ioh", "<cmd>Gitsigns select_hunk<CR>", "inner part of a git Hunk")

        -- stylua: ignore end
        require("which-key").add({ { "<leader>g", group = "Git…" } })
        require("which-key").add({ { "<leader>gh", group = "Hunks…" } })
      end,
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      -- two different keymaps for the same function : either git group or UI group
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "open LazyGit" },
      { "<leader>ug", "<cmd>LazyGit<cr>", desc = "open LazyGit" },
    },
  },
}
