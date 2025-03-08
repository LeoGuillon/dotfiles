return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- displays the number of lazy plugins updates

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
          -- TODO: add the root dir (e.g. where the .git dir is located)
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
            -- TODO: replace by just the filename once the root dir has been implemented
            path = 1,
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
