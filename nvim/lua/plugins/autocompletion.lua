return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- UTILITIES
    { -- needed for snippets
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "onsails/lspkind.nvim", -- vs-code like pictograms
    -- SOURCES
    -- TODO: sources to add :
    -- R,
    -- css, fonts, colors,
    -- greek, latex symbols
    "hrsh7th/cmp-buffer", -- buffer
    "hrsh7th/cmp-cmdline", -- command line commands
    "hrsh7th/cmp-nvim-lsp", -- lsp
    "hrsh7th/cmp-nvim-lua", -- lua API
    "chrisgrieser/cmp-nerdfont", -- nerdfont icons
    "hrsh7th/cmp-path", -- path for files
    "R-nvim/cmp-r", -- R from R.nvim
    "saadparwaiz1/cmp_luasnip", -- snippets
    "micangl/cmp-vimtex", -- vimtex support
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local cmp_r = require("cmp_r")

    -- loads vscode style snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body) -- using LuaSnip as the snippet engine
        end,
      },
      window = { -- our window for autocompletion
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({ -- keymaps during autocompletion
        ["<Up>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<Down>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<Esc>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- accept current selection without explicitely selecting
        ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- accept current selection without explicitely selecting
        ["<C-Space>"] = cmp.mapping.complete(), -- popout the completion window
      }),
      sources = cmp.config.sources({ -- sources for autocompletion, sorted by decreasing priority
        { name = "luasnip" }, -- snippets
        { name = "path" }, -- path
        { name = "nvim_lua" }, -- lua API
        { name = "cmp_r" }, -- R
        { name = "nvim_lsp" }, -- lsp
        { name = "vimtex" }, -- vimtex support
        { name = "lazydev", group_index = 0 }, -- lazydev
        { name = "nerdfont" }, -- nerdfont icons
        { name = "buffer" }, -- text in buffer
      }),
      formatting = { -- configure lspkind for vs-code like pictograms in completion menu
        expandable_indicator = true, -- default behaviour
        fields = { "abbr", "kind", "menu" }, -- default displayed fields
        format = lspkind.cmp_format({
          mode = "symbol_text",
          ellipsis_char = "…",
          menu = {
            buffer = "[Buffer]",
            cmdline = "[CmdLine]",
            lazydev = "[LazyDev]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            nerdfont = "[NerdFont]",
            path = "[Path]",
            luasnip = "[LuaSnip]",
            vimtex = "[Vimtex]",
          },
        }),
      },
    })

    -- setup for search forward (`/`)
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- setup for command line
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline", option = {
          ignore_cmds = { "Man", "!" },
        } },
      }),
    })

    cmp_r.setup({
      filetypes = { "r", "rmd" },
    })
  end,
}
