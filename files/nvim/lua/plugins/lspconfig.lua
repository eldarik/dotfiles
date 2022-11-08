local lspconfig = require('lspconfig')
local lsp_installer = require "nvim-lsp-installer"
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  'bashls', 'pyright', 'yamlls', 'ansiblels', 'cssls', 'diagnosticls', 'eslint',
  'emmet_ls', 'html', 'jsonls', 'jdtls', 'tsserver', 'sumneko_lua',
  'zk', 'solargraph', 'sqlls', 'stylelint_lsp', 'terraformls',
  'vimls', 'lemminx'
}

vim.diagnostic.config({
  virtual_text = {
    prefix = '<'
  }
})

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
  lspconfig[name].setup {}
end

lspconfig.solargraph.setup {
  filetypes = { 'ruby', 'rake', 'eruby', 'slim' },
  capabilities = capabilities
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
