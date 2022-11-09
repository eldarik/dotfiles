return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    --- file browsering & navigation
    use 'jistr/vim-nerdtree-tabs'
    use { 'kyazdani42/nvim-web-devicons' }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons'
      },
      config = require('nvim-tree').setup({
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
    }
    use 'christoomey/vim-tmux-navigator'

    --- colorscheme
    use { 'overcache/NeoSolarized' }

    use { 'LudoPinelli/comment-box.nvim' }

    use {
      'hoob3rt/lualine.nvim',
      config = require("plugins.lualine")
    }
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
      branch = 'v2', -- optional but strongly recommended
      config = require('hop').setup {}
    }

    -- Fuzzy search
    use 'junegunn/fzf.vim'
    use {
      'ibhagwan/fzf-lua',
      config = require('fzf-lua').setup({
        winopts = {
          split = "belowright new"
        }
      })
    }

    use {
      'goolord/alpha-nvim',
      config = require('alpha').setup(require'alpha.themes.startify'.config)
    }

    use 'tpope/vim-rails'

    -- LSP
    use {
      'williamboman/nvim-lsp-installer',
      'neovim/nvim-lspconfig',
      config = require("plugins.lspconfig")
    }

    --- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp',
      'windwp/nvim-autopairs',
      'ThePrimeagen/refactoring.nvim',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-endwise',
      'windwp/nvim-ts-autotag',
      'andymass/vim-matchup',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-context',
      config = require("plugins.treesitter")
    }
  end,

  config = {
    enable = true,
    -- log = { level = 'debug' },
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
