local present = pcall(require, "lualine")
if not present then
  return
end

require('lualine').setup {
  options = {
    globalstatus = true,
    -- Initial value only; lua/theme.lua re-setups this to match light/dark.
    -- Not 'auto' — lualine loads before colorscheme.lua, so it would resolve wrong.
    theme = 'papercolor_light',
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
  },
  sections = {
    lualine_a = { 'mode', 'diff' },
    lualine_b = {{ 'branch', icon = '⌥' }},
    lualine_c = {{ 'filename', files_status = true, path = 1 }},
    lualine_x = { 'diagnostics', 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
}
