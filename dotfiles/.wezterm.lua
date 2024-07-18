local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font({
	family = "Monaspace Neon",
	harfbuzz_features = { "calt=1", "liga=1", "ss01=1", "ss02=1", "cv30=1", "cv60=1" },
})
config.font_size = 10

config.color_scheme = "Apple System Colors"
config.bold_brightens_ansi_colors = false

config.keys = {
	{
		key = "F11",
		action = wezterm.action.ToggleFullScreen,
	},

	{
		key = "[",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	{
		key = "]",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

config.enable_tab_bar = false
config.enable_wayland = false

return config
