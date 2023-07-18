local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  {
    { 'kyazdani42/nvim-web-devicons' },
    { 'kyazdani42/nvim-tree.lua' },
    { 'christoomey/vim-tmux-navigator' },
    {
      'overcache/NeoSolarized',
    },
    { 'LudoPinelli/comment-box.nvim' },
    {
      'hoob3rt/lualine.nvim',
      config = require('plugins.lualine')
    },
    { 'yorik1984/lualine-theme.nvim' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-abolish' },
    { 'airblade/vim-gitgutter' },
    { 'AndrewRadev/splitjoin.vim' },
    { 'lewis6991/impatient.nvim' },
    { 'nathom/filetype.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'windwp/nvim-spectre' },
    { 'janko/vim-test' },
    {
      'phaazon/hop.nvim',
      branch = 'v2',
      config = require('hop').setup {}
    },
    {
      'ibhagwan/fzf-lua',
      commit = '7e53aeb',
      config = require('fzf-lua').setup(
        {
          winopts = {
            split = 'belowright new'
          },
          fzf_colors = {
            ['fg']      = { 'fg', 'CursorLine' },
            ['bg']      = { 'bg', 'Normal' },
            ['hl']      = { 'fg', 'Comment' },
            ['fg+']     = { 'fg', 'Normal' },
            ['bg+']     = { 'bg', 'CursorLine' },
            ['hl+']     = { 'fg', 'Statement' },
            ['info']    = { 'fg', 'PreProc' },
            ['prompt']  = { 'fg', 'Conditional' },
            ['pointer'] = { 'fg', 'Exception' },
            ['marker']  = { 'fg', 'Keyword' },
            ['spinner'] = { 'fg', 'Label' },
            ['header']  = { 'fg', 'Comment' },
            ['gutter']  = { 'bg', 'Normal' },
          }
        }
      )
    },
    {
      'goolord/alpha-nvim',
      config = require('alpha').setup(require 'alpha.themes.theta'.config)
    },
    { 'tpope/vim-rails' },
    {
      'VonHeikemen/lsp-zero.nvim',
      dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
      },
      config = require('plugins.lspconfig'),
    },

    {
      'zbirenbaum/copilot.lua',
      dependencies = {
        'zbirenbaum/copilot-cmp',
        config = require('copilot_cmp').setup({
          method = 'getCompletionsCycling',
        })
      },
      config = require('copilot').setup()
    },

    -- Treesitter
    { 'danymat/neogen', },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = require('plugins.treesitter'),
      dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
      },
    },
    { 'windwp/nvim-autopairs', },
    { 'ThePrimeagen/refactoring.nvim', },
    { 'nvim-treesitter/nvim-treesitter-textobjects', },
    { 'RRethy/nvim-treesitter-endwise', },
    { 'windwp/nvim-ts-autotag', },
    { 'andymass/vim-matchup', },
    { 'nvim-treesitter/nvim-treesitter-context' },

    { 'slim-template/vim-slim' },
    { 'digitaltoad/vim-jade' },
    { 'dag/vim-fish' },
    { 'vtm9/vim-pry' },
    { 'Pocco81/auto-save.nvim' },
    {
      'norcalli/nvim-colorizer.lua',
      config = require('colorizer').setup()
    },
  }
)

require('plugins.nvim-tree')
