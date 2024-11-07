local wezterm = require 'wezterm';

return {
  color_scheme = 'Catppuccin Macchiato',
  font = wezterm.font {
    family = 'FiraCode Nerd Font Mono',
    weight = 450,
    harfbuzz_features = { 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss07', 'ss08', 'zero', 'onum' },
  },
  font_size = 14.0,
  hide_tab_bar_if_only_one_tab = true,
  default_prog = { '/usr/local/bin/fish', '-l' },
}
