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
    local icons = require("core.utils").icons

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
    require("which-key").add({ { "<leader>h", group = "Harpoon…", icon = icons.ui.harpoon } })
    map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add current buffer to harpoon" })
    map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon List" })
    map("n", "<leader>oh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon" })
    map("n", "<leader>hs", function() toggle_telescope(harpoon:list()) end, { desc = "Toggle harpoon telescope search" })
    map("n", "<leader>sh", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon" })

    -- TODO: create the mappings with a for loop
    for i = 1, 4 do
      map("n", "<leader>" .. i, function () harpoon:list():select(i) end, { desc = "Go to harpoon " .. i })
    end
    -- TODO: setup these mappings with a modifier key + 1–4
    -- stylua: ignore end
  end,
}
