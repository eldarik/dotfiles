local wezterm = require 'wezterm'

local merge_tables = function(first_table, second_table)
  for k, v in pairs(second_table) do
    first_table[k] = v
  end
  return first_table
end

local extract_tab_bar_colors_from_theme = function(theme_name)
  local wez_theme = wezterm.color.get_builtin_schemes()[theme_name]
  return {
    window_frame_colors = {
      active_titlebar_bg = wez_theme.background,
      inactive_titlebar_bg = wezterm.color.parse(wez_theme.background):darken(0.8),
    },
    tab_bar_colors = {
      inactive_tab_edge = wezterm.color.parse(wez_theme.background):darken(0.8),
      active_tab = {
        bg_color = wez_theme.brights[3],
        fg_color = wez_theme.background,
      },
      inactive_tab = {
        bg_color = wez_theme.background,
        fg_color = wez_theme.foreground,
      },
      inactive_tab_hover = {
        bg_color = wezterm.color.parse(wez_theme.background):lighten(0.1),
        fg_color = wezterm.color.parse(wez_theme.foreground):lighten(0.2),
      },
      new_tab = {
        bg_color = wez_theme.background,
        fg_color = wez_theme.foreground,
      },
      new_tab_hover = {
        bg_color = wez_theme.brights[3],
        fg_color = wez_theme.background,
      },
    },
  }
end

local tab_bar_theme = extract_tab_bar_colors_from_theme('Solarized Light (Gogh)')

return {
  font = wezterm.font("Anonymous Pro", { weight = 'Bold' }),

  -- Better rendering on retina displays
  -- freetype_load_target = "Normal",

  -- Better rendering on non retina displays
  freetype_load_target = "Light",

  -- font = wezterm.font("Anonymous Pro"),
  bold_brightens_ansi_colors = true,

  -- For 13 inch display
  -- font_size = 15.0,
  -- For bigger display
  font_size = 17.0,

  -- color_scheme = 'Solarized (light) (terminal.sexy)',
  color_scheme = 'Solarized Light (Gogh)',
  enable_tab_bar = false,
  -- use_fancy_tab_bar = false,
  colors = {
    tab_bar = tab_bar_theme.tab_bar_colors,
  },
  window_frame = merge_tables(
    {
      font = wezterm.font("Anonymous Pro", { weight = "Bold" }),
    },
    tab_bar_theme.window_frame_colors
  ),
  window_decorations = "RESIZE",
  window_padding = {
    left = '0.7cell',
    right = '0.3cell',
    top = '0.2cell',
    bottom = '0.0cell',
  }
}
