local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	color_scheme = "Catppuccin Macchiato",
	default_cursor_style = "SteadyUnderline",
	font_size = 10.5,
	window_background_opacity = 0.8,
	tab_bar_at_bottom = true,
}

wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
	position = "bottom",
	max_width = 32,
	dividers = "rounded", -- or "slant_left", "arrows", "rounded", false
	indicator = {
		leader = {
			enabled = true,
			off = " ",
			on = " ",
		},
		mode = {
			enabled = true,
			names = {
				resize_mode = "RESIZE",
				copy_mode = "VISUAL",
				search_mode = "SEARCH",
			},
		},
	},
	tabs = {
		numerals = "arabic", -- or "roman"
		pane_count = "superscript", -- or "subscript", false
		brackets = {
			active = { "", " |" },
			inactive = { "", " |" },
		},
	},
	clock = { -- note that this overrides the whole set_right_status
		enabled = true,
		format = "%H:%M  ", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
	},
})

return config
