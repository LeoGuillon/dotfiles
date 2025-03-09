return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "letieu/harpoon-lualine",
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
    },
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- displays the number of lazy plugins updates

    local function get_git_root_dir()
      local root_path = vim.fs.root(0, ".git")
      -- stylua: ignore 
      if root_path == nil then return nil end

      local root_name = vim.fn.fnamemodify(root_path, ":t")
      return root_name
    end

    -- configuration de lualine
    lualine.setup({
      extensions = {
        "lazy",
        "mason",
        "nvim-tree",
        "man",
        "trouble",
      },
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "dashboard",
          "query",
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = "", -- vim icon for goodness <3
            -- icon = "", -- nvim icon, the render is a bit less cleaner
          },
        },
        lualine_b = {
          {
            get_git_root_dir,
            -- stylua: ignore
            cond = function() return get_git_root_dir() ~= nil end, -- hides if no git dir
            icon = "",
          },
          {
            "branch",
            icon = "", -- same icon used as in my starship prompt
          },
        },
        lualine_c = {
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = {
              left = 1,
              right = 0,
            },
          },
          -- we make sure to have 0 padding and separation between file type and name
          -- so that it's cleaner
          {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 0, -- only the filename
            -- path = 1, -- relative path to cwd
            symbols = {
              modified = "",
              readonly = "",
              unnamed = "unnamed buffer",
              newfile = "new file",
            },
            padding = {
              left = 0,
              right = 1,
            },
          },
          -- not 100% sure to have the diff section
          -- {
          --   "diff",
          --   symbols = {
          --     -- circles icon to better match the overall rounded theme
          --     added = "󰐗 ",
          --     modified = "󰛿 ",
          --     removed = "󰍶 ",
          --   },
          -- },
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              hint = " ",
              info = " ",
            },
          },
          -- not 100% sure yet to include or not harpoon in the statusline
          -- {
          --   "%=",
          --   separator = " ",
          -- },
          -- {
          --   "harpoon2",
          --   icon = "󰐃",
          --   -- icon = "󰀱"
          --   separator = " ",
          --   indicators = {
          --     "1",
          --     "2",
          --     "3",
          --     "4",
          --   },
          --   active_indicators = {
          --     "[1]",
          --     "[2]",
          --     "[3]",
          --     "[4]",
          --   },
          -- },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          -- { "searchcount" }, -- redundant while there's the usual commandline
          -- { "selectioncount" }, -- same comment as for search count
          -- { "encoding" },
          -- { "fileformat" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
    })
  end,
}
