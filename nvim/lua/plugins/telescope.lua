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
          i = {},
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
    map("n", "<leader>fb", builtin.buffers, { desc = "files in Buffers" })
    map("n", "<leader>fc", builtin.commands, { desc = "Commands" })
    map("n", "<leader>ff", builtin.find_files, { desc = "Files in cwd" })
    -- map("n", "<leader>fg", builtin.registers, { desc = "Find registers" }) -- not very useful thanks to which-key
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
    -- map("n", "<leader>fm", builtin.marks, { desc = "marks" }) -- same remark as for registers
    map("n", "<leader>fm", builtin.man_pages, { desc = "Man pages entries" })
    map("n", "<leader>fo", builtin.vim_options, { desc = "vim Options" })
    map("n", "<leader>fp", builtin.planets, { desc = "Planets <3" })
    map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    map("n", "<leader>fs", builtin.live_grep, { desc = "String in cwd" })
    map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todos in cwd" })
    map("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Undos" })

    require("which-key").add({ { "<leader>f", group = "Find with telescope…" } })
  end,
}
