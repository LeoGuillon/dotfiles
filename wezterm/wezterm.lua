-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- font
config.font = wezterm.font({
  family = "JetBrainsMono Nerd Font Mono",
  weight = "Medium",
})
config.font_size = 13

config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 10,
  right = 0,
  top = 5,
  bottom = 2,
}

config.window_background_opacity = 0.8
config.macos_window_background_blur = 90

-- and finally, return the configuration to wezterm
return config
