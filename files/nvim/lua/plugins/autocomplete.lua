local M = {}

function M.run(use)
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      -- luasnip setup
      local luasnip = require 'luasnip'

      require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })
      require("luasnip.loaders.from_vscode").load()

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'cmdline' },
          { name = 'path' },
        },
      }
    end,
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require "lsp_signature".setup({
        bind = true,
        doc_lines = 0,
        hint_enable = false,
        handler_opts = {
          border = "none"
        },
        floating_window = false,
        toggle_key = "<C-d>"
      })
    end
  }

  use {
    'onsails/lspkind-nvim',
    requires = { 'hrsh7th/nvim-cmp' },
    config = function()
      local lspkind = require('lspkind')
      local cmp = require 'cmp'
      cmp.setup {
        formatting = {
          format = lspkind.cmp_format({
            with_text = false, -- do not show text alongside icons
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          })
        }
      }

    end
  }

  use {
    'rafamadriz/friendly-snippets',
    requires = { 'hrsh7th/nvim-cmp' },
  }

  -- nvim-cmp supports additional completion capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
end

return M
