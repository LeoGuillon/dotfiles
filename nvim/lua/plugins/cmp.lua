return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-cmdline", -- source for vim command line
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<Down>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<S-Up>"] = cmp.mapping.scroll_docs(-1),
        ["<S-Down>"] = cmp.mapping.scroll_docs(1),
        -- ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<Esc>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- accept current selection without explicitely selecting
      }),

      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "buffer" }, -- text within current buffer
        { name = "luasnip" }, -- snippets
        { name = "nvim_lsp" }, -- lsp
        { name = "nvim_lua" },
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        expandable_indicator = true, -- default behaviour
        fields = { "abbr", "kind", "menu" }, -- default displayed fields
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "…",
          menu = {
            buffer = "[Buffer]",
            luasnip = "[Snippet]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            path = "[Path]",
          },
        }),
      },
    })

    -- search forward and backwards completion
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- vim commandline completion
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
      },
      {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      },
    })
  end,
}
