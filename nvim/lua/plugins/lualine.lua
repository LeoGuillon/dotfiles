return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "letieu/harpoon-lualine",
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
    },
    "catppuccin/nvim",
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

    -- customize catppuccin theme
    local custom_catppuccin = require("lualine.themes.catppuccin-mocha")
    local C = require("catppuccin.palettes").get_palette("mocha")
    custom_catppuccin.normal.b.bg = C.surface1
    custom_catppuccin.normal.c.bg = C.surface0
    custom_catppuccin.insert.b.bg = C.surface1
    custom_catppuccin.terminal.b.bg = C.surface1
    custom_catppuccin.command.b.bg = C.surface1
    custom_catppuccin.visual.b.bg = C.surface1
    custom_catppuccin.replace.b.bg = C.surface1

    -- custom extensions
    local function custom_extension(filetypes, mode, icon)
      local M = {}
      M.filetypes = filetypes
      M.sections = {
        lualine_a = {
          {
            function()
              return mode
            end,
            icon = icon,
            separator = {
              left = "",
              right = "",
            },
          },
        },
      }

      return M
    end

    -- TODO: setup custom extension for conform window
    -- local conform_extension = custom_extension({""})
    local harpoon_extension = custom_extension({ "harpoon" }, "HARPOON", "󰀱")
    local lazy_extension = custom_extension({ "lazy" }, "LAZY", "󰒲")
    local lazygit_extension = custom_extension({ "lazygit" }, "GIT", "󰊢")
    local mason_extension = custom_extension({ "mason" }, "MASON", "󰟾")
    local telescope_extension = custom_extension({ "TelescopePrompt" }, "FIND", "")
    local yazi_extension = custom_extension({ "yazi" }, "YAZI", "󰇥")

    -- configuration de lualine
    lualine.setup({
      extensions = {
        -- custom extensions
        harpoon_extension,
        lazy_extension,
        lazygit_extension,
        mason_extension,
        telescope_extension,
        yazi_extension,
      },
      options = {
        icons_enabled = true,
        theme = custom_catppuccin,
        component_separators = { left = "", right = "│" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "dashboard",
          "query",
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true, -- enables a single statusline for every window
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
            separator = {
              left = "",
              right = "",
            },
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
            -- TODO: add icons to have git status,
            -- same icons used as in my starship prompt
          },
        },
        lualine_c = {
          {
            "harpoon2",
            icon = "",
            -- icon = "󰐃",
            -- icon = "󰀱"
            padding = {
              left = 0,
              right = 0,
            },
            indicators = {
              "1 ",
              "2 ",
              "3 ",
              "4 ",
            },
            active_indicators = {
              "1*",
              "2*",
              "3*",
              "4*",
            },
          },
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
            -- path = 0, -- only the filename
            path = 1, -- relative path to cwd
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
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          -- TODO: add mason available updates to this section
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
            sources = {
              "nvim_lsp",
              "nvim_diagnostic",
              "coc",
            },
            symbols = {
              error = " ",
              warn = " ",
              hint = " ",
              info = " ",
            },
          },
          -- { "searchcount" }, -- redundant while there's the usual commandline
          -- { "selectioncount" }, -- not that useful to me tbh, but we never say never I guess
          -- { "encoding" }, -- quite useless as well tbh, everything is utf-8 right. Right?
        },
        lualine_y = {
          { "filetype" },
          {
            "lsp_status",
            icon = "",
          },
        },
        lualine_z = {
          {
            "progress",
          },
          {
            "location",
            separator = {
              right = "",
            },
          },
        },
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
