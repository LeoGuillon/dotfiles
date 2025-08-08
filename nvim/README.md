# Neovim config

<a href="https://dotfyle.com/LeoGuillon/dotfiles-nvim"><img src="https://dotfyle.com/LeoGuillon/dotfiles-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/LeoGuillon/dotfiles-nvim"><img src="https://dotfyle.com/LeoGuillon/dotfiles-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/LeoGuillon/dotfiles-nvim"><img src="https://dotfyle.com/LeoGuillon/dotfiles-nvim/badges/plugin-manager?style=flat" /></a>

<!-- TODO: insert dashboard, file showcase-->

## File structure

```bash
├── lua
│  ├── core
│  └── plugin
├── after
│  └── ftplugin
└── snippets
   ├── general
   └── project-specific
```

## Inspiration

The first stones for this config were done thanks to the nice tutoriel made by [Vincent Jousse](https://github.com/vjousse) available [here](https://vincent.jousse.org/blog/fr/tech/configurer-neovim-comme-ide-a-partir-de-zero-tutoriel-guide/).

Other tips and tricks were found in other sources, most notably [Chris Grieser](https://github.com/chrisgrieser) among others. I usually put the sources from ideas I get directly in the source code, feel free to check (notably `keymaps.lua`)

## Plugins used

- [Comment.nvim](https://github.com/numToStr/Comment.nvim.git)
- [LuaSnip](https://github.com/L3mon4d3/LuaSnip.git)
- [catppuccin](https://github.com/catppuccin/nvim.git)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer.git)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline.git)
- [cmp-nerdfont](https://github.com/chrisgrieser/cmp-nerdfont.git)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp.git)
- [cmp-path](https://github.com/hrsh7th/cmp-path.git)
- [cmp-vimtex](https://github.com/micangl/cmp-vimtex.git)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip.git)
- [comment-box.nvim](https://github.com/LudoPinelli/comment-box.nvim.git)
- [conform.nvim](https://github.com/stevearc/conform.nvim.git)
- [csvview.nvim](https://github.com/hat0uma/csvview.nvim.git)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim.git)
- [dial.nvim](https://github.com/monaqa/dial.nvim.git)
- [flash.nvim](https://github.com/folke/flash.nvim.git)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim.git)
- [harpoon-lualine](https://github.com/letieu/harpoon-lualine.git)
- [harpoon](https://github.com/ThePrimeagen/harpoon.git)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim.git)
- [lazy.nvim](https://github.com/folke/lazy.nvim.git)
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim.git)
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim.git)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim.git)
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim.git)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git)
- [mason.nvim](https://github.com/mason-org/mason.nvim.git)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs.git)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp.git)
- [nvim-justice](https://github.com/chrisgrieser/nvim-justice.git)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig.git)
- [nvim-scissors](https://github.com/chrisgrieser/nvim-scissors.git)
- [nvim-spider](https://github.com/chrisgrieser/nvim-spider.git)
- [nvim-surround](https://github.com/kylechui/nvim-surround.git)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context.git)
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons.git)
- [persistence.nvim](https://github.com/folke/persistence.nvim.git)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim.git)
- [rainbow-delimiters.nvim](https://github.com/hiphish/rainbow-delimiters.nvim.git)
- [snacks.nvim](https://github.com/folke/snacks.nvim.git)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim.git)
- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim.git)
- [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim.git)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim.git)
- [trouble.nvim](https://github.com/folke/trouble.nvim.git)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator.git)
- [vimtex](https://github.com/lervag/vimtex.git)
- [which-key.nvim](https://github.com/folke/which-key.nvim.git)
- [yazi.nvim](https://github.com/mikavilpas/yazi.nvim.git)
