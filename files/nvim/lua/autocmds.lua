vim.cmd [[
  augroup myfiletypes
    autocmd FileType eruby.yaml set filetype=yaml
    autocmd FileType eruby.html set filetype=html
  augroup END
]]

-- Light/dark switching. theme-toggle and the tmux client-*-theme hooks send
-- SIGUSR1; FocusGained is a safety net for any flip that missed the signal.
vim.api.nvim_create_autocmd('Signal', {
  pattern = 'SIGUSR1',
  callback = function() require('theme').sync() end,
})

vim.api.nvim_create_autocmd('FocusGained', {
  callback = function() require('theme').sync() end,
})
