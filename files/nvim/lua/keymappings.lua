local keymap = vim.keymap.set
local options = { silent = false }

-- NvimTreeToggle
keymap('n', '<leader><leader>', ':NvimTreeToggle<CR>')
keymap('n', '<leader>n', ':NvimTreeFindFile<CR>')
keymap('n', '<leader>т', ':NvimTreeFindFile<CR>')

-- Files
keymap('n', 'fq', ':q!<CR>')
keymap('n', 'ай', ':q!<CR>')
keymap('n', 'fw', ':w!<CR>')
keymap('n', 'ац', ':w!<CR>')
keymap('n', 'fv', ':vsplit<CR>')
keymap('n', 'ам', ':vsplit<CR>')
keymap('n', 'fs', ':split<CR>')
keymap('n', 'аы', ':split<CR>')
-- reload current file
keymap('n', '<leader>e', ':e! <CR>')

-- Tabs
keymap('n', 'tq', ':tabclose<CR>')
keymap('n', 'ей', ':tabclose<CR>')
keymap('n', 'fj', ':tabprev<CR>')
keymap('n', 'ао', ':tabprev<CR>')
keymap('n', 'fk', ':tabnext<CR>')
keymap('n', 'ал', ':tabnext<CR>')
-- new
keymap('n', 'fn', ':tabe<CR>')
keymap('n', 'ат', ':tabe<CR>')
-- same file in new tab
keymap('n', 'fe', ':tab split<CR>')
keymap('n', 'ау', ':tab split<CR>')

-- Config reload & save
keymap('n', '<leader>vr', ':source $MYVIMRC<CR>')
keymap('n', '<leader>vl', ':vsp $MYVIMRC<CR>')

-- Better window movement
keymap("n", "<C-l>", "<C-w>l", silent)
keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)

-- Comment Box
keymap("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", options)
keymap("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", options)

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting({ async = true })<CR>", silent)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)

-- Tests
keymap("n", "<leader>t", ":TestNearest<CR>")

-- Hop
keymap("n", "mw", ":HopWord<CR>")
keymap("n", "mj", ":HopLine<CR>")
keymap("n", "mk", ":HopLineBC<CR>")
keymap("n", "ml", ":HopLine<CR>")

-- FzfLua
keymap("n", "<leader>g", ":FzfLua git_files<CR>")
keymap("n", "<leader>g", ":FzfLua files<CR>")
keymap("n", "<leader>s", ":FzfLua live_grep<CR>")
keymap("n", "<leader>w", ":FzfLua grep_cword<CR>")
keymap("n", "<leader>c", ":FzfLua git_commits<CR>")

keymap("v", "/", "y:let @/ = @\"<CR>")
keymap("n", "<leader>h", ":set nohlsearch<CR>")
