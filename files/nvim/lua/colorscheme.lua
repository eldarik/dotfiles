-- colorscheme NeoSolarized

-- colorscheme solarized-osaka
-- colorscheme solarized-osaka-day
-- colorscheme solarized-osaka-moon
-- colorscheme solarized-osaka-night
-- colorscheme solarized-osaka-storm

--  colorscheme solarized-flat

-- colorscheme solarized8_high
-- colorscheme solarized8
-- colorscheme solarized8_flat
-- colorscheme solarized8_low

-- colorscheme solarized

-- 'background' is owned by lua/theme.lua (applied at the bottom of this file).
vim.cmd [[
  try
    colorscheme solarized
  catch
    colorscheme evening
  endtry
]]

-- let the terminal own the background (also lets tmux dim inactive panes)
local function clear_bg()
  for _, group in ipairs({ 'Normal', 'NormalNC', 'NormalFloat', 'EndOfBuffer', 'SignColumn' }) do
    vim.api.nvim_set_hl(0, group, vim.tbl_extend('force',
      vim.api.nvim_get_hl(0, { name = group }), { bg = 'none', ctermbg = 'none' }))
  end
end

vim.api.nvim_create_autocmd('ColorScheme', { callback = clear_bg })
clear_bg()

-- Runs last in init.lua, so lualine is already set up and startup lands on the
-- correct theme. clear_bg re-runs on its own via the ColorScheme autocmd above.
require('theme').apply()
