local servers = {
  'bashls', 'pyright', 'yamlls', 'ansiblels', 'cssls', 'diagnosticls', 'eslint',
  'emmet_ls', 'html', 'jsonls', 'jdtls', 'tsserver', 'lua_ls',
  'zk', 'solargraph', 'sqlls', 'stylelint_lsp', 'terraformls',
  'vimls', 'lemminx'
}
local lsp = require('lsp-zero')
lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = servers,
  handlers = {
    lsp.default_setup,
  },
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
})

lsp.set_sign_icons(
  {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
  }
)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = false,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_config = lsp.defaults.cmp_config({
  sources = {
    -- Copilot Source
    { name = "copilot",  group_index = 2 },
    -- Other Sources
    { name = "nvim_lsp", group_index = 2 },
    { name = "path",     group_index = 2 },
    { name = "luasnip",  group_index = 2 },
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  },
})

cmp.setup(cmp_config)
