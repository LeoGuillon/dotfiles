-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.default_cursor_style = "SteadyBar"
config.cursor_blink_rate = 0

-- font
config.font = wezterm.font({
	-- family = "Lilex Nerd Font Mono GS", -- my own variant of Lilex, with slashed zero and open g
	family = "Lilex Nerd Font Mono",
	weight = "Medium",
})
config.font_size = 13
-- config.harfbuzz_features = {
-- 	"zero=1", -- slashed zero
-- 	"cv02=1", -- open g
-- 	"cv08=1", -- alt inequalities
-- 	"ss01=1", -- restore arrows
-- }

config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 10,
	right = 0,
	top = 5,
	bottom = 2,
}

config.window_background_opacity = 1

-- and finally, return the configuration to wezterm
return config
