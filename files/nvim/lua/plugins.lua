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
      dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua", -- FZF Lua instead of fzf.vim
      },
      config = function()
        local codecompanion = require("codecompanion")
        local actions = require("codecompanion.actions")
        local fzf = require("fzf-lua")

        codecompanion.setup({
          display = {
            chat = {
              intro_message = "Welcome to Code Companion 🚀",
              show_header_separator = true,
              separator = "─",
              show_references = true,
              show_settings = false,
              show_token_count = true,
              start_in_insert_mode = false,
            },
          },
          ui = {
            backend = "telescope", -- Keep telescope for other parts if you prefer
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
        })

        local action_list = {
          { name = "Chat", desc = "Open chat with LLM", fn = actions.chat },
          { name = "Open chats ...", desc = "View open chats", fn = actions.open_chats },
          { name = "Custom Prompt", desc = "Send custom prompt inline", fn = actions.prompt },
          { name = "Explain", desc = "Explain selected code", fn = actions.explain },
          { name = "Unit Tests", desc = "Generate unit tests", fn = actions.unit_tests },
          { name = "Fix code", desc = "Fix selected code", fn = actions.fix },
          { name = "Commit Message", desc = "Generate commit message", fn = actions.commit_message },
          { name = "Code workflow", desc = "Guide LLM through code writing", fn = actions.code_workflow },
          { name = "Edit↔Test workflow", desc = "Cycle through editing and testing", fn = actions.edit_test_workflow },
        }

        local function fzf_codecompanion_picker()
          fzf.fzf_exec(
            vim.tbl_map(function(a)
              return string.format("%s — %s", a.name, a.desc)
            end, action_list),
            {
              prompt = "󰚩  CodeCompanion > ",
              previewer = false,
              winopts = {
                height = 0.25, -- Smaller height
                width = 0.3, -- Smaller width
                row = 0.4,
                col = 0.5,
                border = "rounded",
              },
              actions = {
                default = function(selected)
                  local label = selected[1]:match("^(.-) —")
                  for _, a in ipairs(action_list) do
                    if a.name == label then
                      a.fn()
                      return
                    end
                  end
                end,
              },
            }
          )
        end

        vim.keymap.set("n", "<leader>aa", fzf_codecompanion_picker, { desc = "CodeCompanion Actions (fzf-lua)" })
      end
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
