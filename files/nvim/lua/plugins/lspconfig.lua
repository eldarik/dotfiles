local lspconfig = require('lspconfig')

local servers = {
  'bashls', 'pyright', 'yamlls', 'ansiblels', 'cssls', 'diagnosticls', 'eslint',
  'emmet_ls', 'html', 'jsonls', 'jdtls', 'tsserver', 'sumneko_lua',
  'zk', 'solargraph', 'sqlls', 'stylelint_lsp', 'terraformls',
  'vimls', 'lemminx'
}
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed(servers)
lsp.setup()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local sources = lsp.defaults.cmp_sources()
table.insert(sources, { name = 'nvim_lsp_signature_help' })

local cmp_config = lsp.defaults.cmp_config({
  sources = sources,
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  },
})

cmp.setup(cmp_config)
