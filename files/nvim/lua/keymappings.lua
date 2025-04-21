local keymap = vim.keymap.set
local options = { silent = false }

-- NvimTreeToggle
keymap('n', '<leader><leader>', ':NvimTreeToggle<CR>')
keymap('n', '<leader>n', ':NvimTreeFindFile<CR>')
keymap('n', '<leader>т', ':NvimTreeFindFile<CR>')

-- Files
keymap('n', 'fq', ':q!<CR>')
keymap('n', 'ай', ':q!<CR>')
keymap('t', 'fq', "<C-\\><C-n>")
keymap('t', 'ай', "<C-\\><C-n>")
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
keymap("n", "<C-l>", "<C-w>l", { silent = true })
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "mz", "<Cmd>lua require('maximize').toggle()<CR>")

-- Comment Box
keymap("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", options)
keymap("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", options)

-- Tests
keymap("n", "<leader>t", ":TestNearest<CR>")
keymap("n", "<leader>T", ":TestFile<CR>")

-- Hop
keymap("n", "mw", ":HopWord<CR>")
keymap("n", "mj", ":HopLine<CR>")
keymap("n", "mk", ":HopLineBC<CR>")
keymap("n", "ml", ":HopLine<CR>")
keymap("x", "mw", "<cmd>HopWord<CR>")
keymap("x", "mj", "<cmd>HopLine<CR>")
keymap("x", "mk", "<cmd>HopLineBC<CR>")
keymap("x", "ml", "<cmd>HopLine<CR>")

-- FzfLua
keymap("n", "<leader>g", ":FzfLua git_files<CR>")
keymap("n", "<leader>f", ":FzfLua files<CR>")
keymap("n", "<leader>b", ":FzfLua buffers<CR>")
keymap("n", "<leader>s", ":FzfLua live_grep<CR>")
keymap("n", "<leader>w", ":FzfLua grep_cword<CR>")
keymap("n", "<leader>c", ":FzfLua git_bcommits<CR>")

keymap("v", "/", "y:let @/ = @\"<CR>")
keymap("n", "<leader>h", ":set nohlsearch<CR>")
keymap("n", "<leader>H", ":set hlsearch<CR>")

keymap("n", "<Leader>r", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", options)
keymap("v", "<Leader>r", "<cmd>lua require('spectre').open_visual()<CR>")

-- LSP
local opts = { noremap = true, silent = true }
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', '<leader>D', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

keymap("n", "<leader>d", ":call pry#insert()<CR>")

keymap("n", "gB", ":Blame<CR>")
keymap("n", "gBl", ":BlameLine<CR>")
keymap("v", "gB", "<cmd>BlameSelected<CR>")

keymap("n", "gb", ":Browse<CR>")
keymap("n", "gbl", ":BrowseLine<CR>")
keymap("v", "gb", "<cmd>BrowseSelected<CR>")

-- Git
keymap('n', '<leader>c', function() require('fzf-lua').git_status() end, { desc = 'Git Changed Files (fzf-lua)' })
keymap('n', 'ga', ':GitGutterStageHunk<CR>', { desc = 'Stage Git Hunk' })
keymap('n', 'gs', ':GitGutterUndoHunk<CR>', { desc = 'Reset Git Hunk' })
keymap('n', ']h', ':GitGutterNextHunk<CR>', { desc = 'Next Git Hunk' })
keymap('n', '[h', ':GitGutterPrevHunk<CR>', { desc = 'Previous Git Hunk' })
keymap('n', '<leader>cm', function() vim.cmd('terminal git commit') end, { desc = 'Git Commit (Terminal)' })
