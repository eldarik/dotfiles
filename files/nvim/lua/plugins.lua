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
    { 'kyazdani42/nvim-tree.lua',      commit = '2a268f631' },
    { 'christoomey/vim-tmux-navigator' },

    { 'overcache/NeoSolarized' },
    { 'lifepillar/vim-solarized8' },
    { 'ishan9299/nvim-solarized-lua' },
    { 'craftzdog/solarized-osaka.nvim' },
    { 'Iron-E/nvim-highlite' },
    --
    { 'LudoPinelli/comment-box.nvim' },
    {
      'numToStr/Comment.nvim',
      opts = {
        -- add any options here
      },
      lazy = false,
    },
    {
      'hoob3rt/lualine.nvim',
    },
    { 'yorik1984/lualine-theme.nvim' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-abolish' },
    { 'airblade/vim-gitgutter' },
    { 'Morozzzko/git_browse.nvim' },

    { 'AndrewRadev/splitjoin.vim' },
    { 'lewis6991/impatient.nvim' },
    { 'nathom/filetype.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'windwp/nvim-spectre' },
    { 'janko/vim-test' },
    { 'phaazon/hop.nvim',            branch = 'v2' },
    { 'ibhagwan/fzf-lua',            commit = '7e53aeb' },
    { 'goolord/alpha-nvim' },
    { 'tpope/vim-rails' },
    {
      'VonHeikemen/lsp-zero.nvim',
      dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
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
      }
    },

    { 'zbirenbaum/copilot.lua' },
    { 'zbirenbaum/copilot-cmp' },

    -- Treesitter
    { 'danymat/neogen', },
    {
      'nvim-treesitter/nvim-treesitter',
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
    { 'norcalli/nvim-colorizer.lua' },
    { 'declancm/maximize.nvim' },

    -- AI coding like cursor editor
    {
      "olimorris/codecompanion.nvim",
      lazy = false,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
    }

  }
)

require('plugins.lualine')
require('hop').setup()

require('plugins.nvim-tree')
require('colorizer').setup()
require('alpha').setup(require 'alpha.themes.theta'.config)
require('plugins.lspconfig')
require('copilot').setup({
  filetypes = {
    txt = true,
  }
})
require('copilot_cmp').setup()
require('plugins.treesitter')
require('fzf-lua').setup(
  {
    winopts = {
      height = 0.9,
      width = 0.9,
      preview = {
        delay = 100
      },
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
require('maximize').setup()

require("codecompanion").setup {
  display = {
    chat = {
      intro_message = "Welcome to Code Companion 🚀",
      show_header_separator = true, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
      separator = "─", -- The separator between the different messages in the chat buffer
      show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
      show_settings = false, -- Show LLM settings at the top of the chat buffer?
      show_token_count = true, -- Show the token count for each response?
      start_in_insert_mode = false, -- Open the chat buffer in insert mode?
    },
  },
  strategies = {
    chat = {
      adapter = "anthropic",
      options = {
        model = "claude-3-7-sonnet-20250219",
      },
    },
    inline = {
      adapter = "anthropic",
      options = {
        model = "claude-3-7-sonnet-20250219",
      },
    },
    actions = {
      adapter = "anthropic",
      options = {
        model = "claude-3-7-sonnet-20250219",
      },
    },
  },
}

-- Code companion

-- local codecompanion = require "codecompanion"
-- vim.keymap.set("n", "<leader>acc", codecompanion.chat.toggle, { desc = "CodeCompanion: Toggle Chat" })
-- vim.keymap.set("n", "<leader>acn", codecompanion.chat.new, { desc = "CodeCompanion: New Chat" })
-- vim.keymap.set("n", "<leader>acr", codecompanion.chat.run, { desc = "CodeCompanion: Run Chat Command" })
-- vim.keymap.set("n", "<leader>ai", codecompanion.inline.toggle, { desc = "CodeCompanion: Toggle Inline" })

-- vim.keymap.set("v", "<leader>ce", codecompanion.inline.edit, { desc = "CodeCompanion: Edit Selection" })
-- vim.keymap.set("v", "<leader>cx", codecompanion.inline.explain, { desc = "CodeCompanion: Explain Selection" })
-- vim.keymap.set("v", "<leader>ct", codecompanion.inline.test, { desc = "CodeCompanion: Generate Tests" })
-- vim.keymap.set("v", "<leader>cf", codecompanion.inline.fix, { desc = "CodeCompanion: Fix Selection" })

-- vim.keymap.set("n", "<leader>aa", codecompanion.actions.show, { desc = "CodeCompanion: Show Actions" })
vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
