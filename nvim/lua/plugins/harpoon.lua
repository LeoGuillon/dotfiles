return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup()

    -- basic telescope configuration
    local conf = require("telescope.config").values
    ---@diagnostic disable-next-line: unused-function
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    -- highlight current line in the buffer harpoon buffer list
    local harpoon_extensions = require("harpoon.extensions")
    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

    -- keymaps
    local map = vim.keymap.set

    -- stylua: ignore start
    map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add current buffer to harpoon" })
    map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon List" })
    map("n", "<leader>oh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon" })
    map("n", "<leader>hs", function() toggle_telescope(harpoon:list()) end, { desc = "Toggle harpoon telescope search" })
    map("n", "<leader>sh", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon" })

    -- TODO: create the mappings with a for loop
    map("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Go to harpoon 1" })
    map("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Go to harpoon 2" })
    map("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Go to harpoon 3" })
    map("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Go to harpoon 4" })
    -- stylua: ignore end

    require("which-key").add({ { "<leader>h", group = "Harpoon…", icon = "󰀱 " } })
  end,
}
