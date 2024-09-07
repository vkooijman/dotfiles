local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font 'Berkeley Mono'
config.font_size = 14.0
config.line_height = 1.2
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
    top = '1cell',
    left = '0',
    right = '0',
    bottom = '0'
}

return config
