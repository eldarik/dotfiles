local wezterm = require 'wezterm'

return {
  font = wezterm.font("Anonymous Pro", { weight = 'Bold' }),
  -- font = wezterm.font("Anonymous Pro"),
  bold_brightens_ansi_colors = true,
  font_size = 15.0,
  -- color_scheme = 'Solarized (light) (terminal.sexy)'
  color_scheme = 'Solarized Light (Gogh)',
  enable_tab_bar = false,
  -- use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  window_padding = {
    left = '0.7cell',
    right = '0.3cell',
    top = '0.2cell',
    bottom = '0.0cell',
  }
}
