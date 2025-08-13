return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fzf implemented in C for moar speed
    "nvim-telescope/telescope-ui-select.nvim", -- ui selection
    "debugloop/telescope-undo.nvim", -- undo tree
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "folke/which-key.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules" },
        mappings = {
          i = {
            ["<C-v>"] = actions.select_horizontal,
            ["<C-h>"] = actions.select_vertical,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("undo")

    local map = vim.keymap.set

    local builtin = require("telescope.builtin")
    map("n", "<leader>sb", builtin.buffers, { desc = "files in Buffers" })
    map("n", "<leader>sc", builtin.commands, { desc = "Commands" })
    map("n", "<leader>sf", builtin.find_files, { desc = "Files in cwd" })
    map("n", "<leader>sg", builtin.registers, { desc = "reGisters" }) -- not very useful thanks to which-key
    map("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
    map("n", "<leader>sm", builtin.marks, { desc = "marks" }) -- same remark as for registers
    -- map("n", "<leader>sm", builtin.man_pages, { desc = "Man pages entries" })
    map("n", "<leader>so", builtin.vim_options, { desc = "vim Options" })
    map("n", "<leader>sp", builtin.planets, { desc = "Planets <3" })
    map("n", "<leader>sr", builtin.oldfiles, { desc = "Recent files" })
    map("n", "<leader>ss", builtin.live_grep, { desc = "String in cwd" })
    map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todos in cwd" })
    map("n", "<leader>su", "<cmd>Telescope undo<cr>", { desc = "Undos" })
    map("n", "<leader>s?", builtin.help_tags, { desc = "Help tags" })

    require("which-key").add({ { "<leader>s", group = "Search with telescope…" } })
  end,
}
