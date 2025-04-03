return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  dependancies = {
    "folke/persistence.nvim",
  },
  opts = function()

    -- stylua: ignore start
    -- local logo = [[
    --                                                                        
    --          ████ ██████           █████      ██                     
    --         ███████████             █████                             
    --         █████████ ███████████████████ ███   ███████████   
    --        █████████  ███    █████████████ █████ ██████████████   
    --       █████████ ██████████ █████████ █████ █████ ████ █████   
    --     ███████████ ███    ███ █████████ █████ █████ ████ █████  
    --    ██████  █████████████████████ ████ █████ █████ ████ ██████ 
    --                                                                          
    -- ]]
    local logo = [[
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣄⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣄⠀⠀⠀⠀⠀⠀⢴⣾⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣟⠛⠛⠛⠛⣻⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⣼⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡟⢻⣿⣿⣆⠀⠀⠀⠀⠀⠀⢻⣿⣿⣧⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣷⣼⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡟⠀⠀⠻⣿⣿⣧⡀⠀⠀⠀⠀⠀⢻⣿⣿⣧⠀⠀⠀⠀⠀
    ⠀⠀⠀⣀⣤⣾⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠏⠀⠀⠀⠀⠙⣿⣿⣷⡀⠀⠀⠀⠀⠀⠹⣿⣿⣷⡀⠀⠀⠀
    ⠀⠀⠀⠙⣿⣿⣿⡍⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⡄⠀⠀⠀⠀⠀⠙⣿⣿⣷⡀⠀⠀⠀⠀⢠⣾⣿⣿⠃⠀⠀⠀
    ⠀⠀⠀⠀⠈⢿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⢿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣄⠀⠀⠀⠀⠀⠘⢿⣿⣿⣄⠀⠀⣠⣿⣿⡿⠁⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡿⠁⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⣰⣿⣿⡿⠁⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⡟⠁⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⣿⣿⡟⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⢻⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠹⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]
    -- credits : https://github.com/HolyShaq/nvim-config/blob/5895a9d95f26027f739b0a98254cff871a4c7f97/lua/plugins/alpha-dashboard.lua
    -- stylua: ignore end

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
          { action = "Telescope find_files", desc = " Find File", icon = " ", key = "f" },
          { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
          -- TODO: add config quick opener
          -- { action = "Telescope find_files(cwd=vim.fn.stdpath('config'))", desc = " Config", icon = " ", key = "c" },
          -- TODO: add restore session
          { action = "LazyGit", desc = " Git", icon = "󰊢 ", key = "g" },
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = "Mason", desc = " Mason", icon = "󰟾 ", key = "m" },
          { action = "Yazi cwd", desc = " Yazi", icon = "󰇥 ", key = "y" },
          {
            action = 'lua require("persistence").load()',
            desc = " Restore session",
            icon = " ",
            key = "s",
          },
          {
            action = 'lua require("persistence").select()',
            desc = " Select a session",
            icon = "󰍂 ",
            key = "S",
          },
          -- stylua: ignore
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q", },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "🚀 Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
          }
        end,
        vertical_center = true,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
