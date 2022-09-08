local keymap = vim.keymap.set
local options = { silent = false }

-- NERDTree
keymap('n', '<leader><leader>', ':NERDTreeMirrorToggle<CR>')
keymap('n', '<leader>n', ':NERDTreeFind<CR>')
keymap('n', '<leader>т', ':NERDTreeFind<CR>')

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

-- Telescope
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", silent)
keymap("n", "<leader>g", "<cmd>lua require('telescope.builtin').find_files()<cr>", silent)
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", silent)
keymap("n", "<leader>s", "<cmd>lua require('telescope.builtin').live_grep()<cr>", silent)
keymap("n", "<leader>d", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", silent)
keymap("n", "<leader>c", "<cmd>lua require('telescope.builtin').git_commits()<cr>", silent)
keymap("n", "<leader>r", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", silent)
