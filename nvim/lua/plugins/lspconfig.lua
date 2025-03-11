return {
  -- MASON
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>um", "<cmd>Mason<cr>", desc = "Open Mason" },
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
          border = "rounded",
          width = 0.8,
          height = 0.9,
          keymaps = {
            toggle_package_expand = "o",
            toggle_help = "?",
          },
        },
      })
    end,
  },
  -- MASON-LSPCONFIG
  {
    "williamboman/mason-lspconfig.nvim",
    dependancies = { "neovim/lspconfig" },
    config = function()
      -- local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup({
        -- list of servers for mason to install
        -- list of available servers : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        ensure_installed = {
          "bashls",
          -- "clangd",
          -- "cssls",
          -- "css_variables",
          -- "html",
          -- "jsonls",
          -- "julials",
          -- "ltex-ls" -- grammar and spell checker for latex and md
          "lua_ls",
          -- "pyright",
          -- "r_language_server",
          "taplo", -- toml
          "texlab", -- latex lsp
          -- "ts_ls",
          -- "yamlls",
        },

        -- handlers = {
        --   function(server_name)
        --     -- each lsp is called with its default config
        --     lspconfig[server_name].setup({})
        --   end,
        -- },
      })
    end,
  },
  -- LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- then, each lsp can be configured as wanted
      -- for example configs : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
              path ~= vim.fn.stdpath("config")
              and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              },
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
              -- library = vim.api.nvim_get_runtime_file("", true)
            },
          })
        end,
        settings = {
          capabilities = capabilities,

          Lua = {
            diagnostics = {
              -- forces the lsp to recognize the `vim` global
              -- credits : https://vincent.jousse.org/blog/fr/tech/configurer-neovim-comme-ide-a-partir-de-zero-tutoriel-guide/#mise-en-place-de-lautocompletion-avec-nvim-cmp
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.taplo.setup({
        capabilities = capabilities,
      })
      lspconfig.texlab.setup({
        capabilities = capabilities,
      })

      -- keymaps setup
      local map = vim.keymap.set

      -- TODO: add relevant keymaps, and on buffer attach
      map("n", "gh", vim.lsp.buf.hover, { desc = "Display hover" })
      map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Display code actions" })
    end,
  },
}
