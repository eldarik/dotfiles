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

vim.cmd [[
  try
    colorscheme solarized
    set background=light
  catch
    colorscheme evening
    set background=light
  endtry
]]
