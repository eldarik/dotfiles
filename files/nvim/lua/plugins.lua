local ensure_packer = function()
  local fn = vim.fn local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup({

  function(use)
    use 'wbthomason/packer.nvim'

    --- file browsering & navigation
    -- use 'scrooloose/nerdtree'
    -- use 'jistr/vim-nerdtree-tabs'
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
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'airblade/vim-gitgutter'

    use 'AndrewRadev/splitjoin.vim'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'
    use 'nvim-lua/plenary.nvim'
    -- use {
    --   'pocco81/auto-save.nvim',
    --   config = function()
    --     local autosave = require("auto-save")
    --     autosave.setup()
    --   end
    -- }
    use 'windwp/nvim-spectre'
    use {
      'nvim-telescope/telescope.nvim',
      config = function()
        local telescope = require('telescope')

        -- telescope.load_extension('refactoring')

        -- vim.api.nvim_set_keymap(
        --   "v",
        --   "<leader>rr",
        --   "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        --   { noremap = true }
        -- )

        telescope.setup {
          defaults = {
            sorting_strategy = "ascending",
            mappings = {
              i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
              },
            },
          },
          pickers = {
            buffers = {
              ignore_current_buffer = true,
              sort_mru = true
            }
          },
        }
      end,
      requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    }

    use 'janko/vim-test'

    -- require('plugins.treesitter').run(use)
    -- require('plugins.lsp').run(use)
    -- require('plugins.autocomplete').run(use)
    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = require'hop'.setup {}
    }
    use 'junegunn/fzf.vim'
    use {
      'ibhagwan/fzf-lua',
      config = require'fzf-lua'.setup({
        winopts = {
          split="belowright new"
        }
      })
    }

    use {
      'goolord/alpha-nvim',
      config = require'alpha'.setup(require'alpha.themes.startify'.config)
      --- config = require 'alpha'.setup {}
    }
    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  config = {
    enable = true,
    -- log = { level = 'debug' },
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
