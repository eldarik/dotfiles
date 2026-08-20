-- Light/dark switching. macOS appearance is the source of truth; this module
-- just reacts to it. Nvim does not opt into DEC mode 2031 and TermResponse
-- never sees the CSI ?997;Nn report, so the nudge arrives as SIGUSR1 from
-- theme-toggle / the tmux client-*-theme hook.
local M = {}

local STATE = vim.fn.expand('~/.cache/theme-mode')

function M.detect()
  local f = io.open(STATE, 'r')
  if f then
    local mode = (f:read('l') or ''):gsub('%s', '')
    f:close()
    if mode == 'light' or mode == 'dark' then return mode end
  end
  -- Fallback: ask macOS directly (the key is absent entirely in light mode)
  return vim.fn.system({ 'defaults', 'read', '-g', 'AppleInterfaceStyle' }):match('Dark')
    and 'dark' or 'light'
end

function M.apply(mode)
  mode = mode or M.detect()
  vim.o.background = mode                  --- must precede the colorscheme call
  pcall(vim.cmd.colorscheme, 'solarized')  --- solarized switches purely on 'background'
  local ok, lualine = pcall(require, 'lualine')
  if ok then
    lualine.setup({ options = { theme = mode == 'dark' and 'solarized_dark' or 'papercolor_light' } })
  end
end

--- No-op when already correct, so it's cheap enough for FocusGained.
function M.sync()
  local mode = M.detect()
  if mode ~= vim.o.background then M.apply(mode) end
end

--- Flips the whole stack, not just nvim.
function M.toggle()
  vim.fn.jobstart({ vim.fn.expand('~/.local/bin/theme-toggle') }, { detach = true })
end

return M
