require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    --- file browsering & navigation
    use 'jistr/vim-nerdtree-tabs'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'christoomey/vim-tmux-navigator'

    use 'overcache/NeoSolarized'

    use 'LudoPinelli/comment-box.nvim'

    use  'hoob3rt/lualine.nvim'
    use 'yorik1984/lualine-theme.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    --- git
    use 'airblade/vim-gitgutter'

    use 'AndrewRadev/splitjoin.vim'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'windwp/nvim-spectre'
    use {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    }

    use 'janko/vim-test'

    use {
      'phaazon/hop.nvim',
      branch = 'v2' -- optional but strongly recommended
    }

    -- Fuzzy search
    use 'junegunn/fzf.vim'
    use 'ibhagwan/fzf-lua'

    use 'goolord/alpha-nvim'

    use 'tpope/vim-rails'

    -- LSP
    use {
      'williamboman/nvim-lsp-installer',
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip'
    }

    --- Treesitter
    use {
      'danymat/neogen',
      'nvim-treesitter/nvim-treesitter',
      'windwp/nvim-autopairs',
      'ThePrimeagen/refactoring.nvim',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-endwise',
      'windwp/nvim-ts-autotag',
      'andymass/vim-matchup',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-context'
    }

    use 'slim-template/vim-slim'
    use 'digitaltoad/vim-jade'
    use 'dag/vim-fish'
    use 'vtm9/vim-pry'
  end,

  config = {
    enable = true,
    -- log = { level = 'debug' },
    display = {
      open_fn = require('packer.util').float,
    }
  }
})

require("plugins.lualine")
require("plugins.treesitter")
require("plugins.lspconfig")
require('nvim-tree').setup({
  view = {
    mappings = {
      list = {
        { key = "s", action = "split" },
        { key = "v", action = "vsplit" },
        { key = "t", action = "tabnew" },
        { key = "f", action = "" },
      }
    }
  }
})
require('hop').setup {}
require('fzf-lua').setup({ winopts = { split = "belowright new" } })
require('alpha').setup(require 'alpha.themes.theta'.config)
