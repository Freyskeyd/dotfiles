local wezterm = require 'wezterm'

return {
	color_scheme = 'OneNord',
	enable_tab_bar = false,

	font_size = 21,
	font = wezterm.font('Fira Code'),

	send_composed_key_when_left_alt_is_pressed = true,

	macos_window_background_blur = 30,
	window_decorations = 'RESIZE',
	keys = {
		{
			key = 'f',
			mods = 'CTRL',
			action = wezterm.action.ToggleFullScreen,
		},
	},
	mouse_bindings = {
		-- Ctrl-click open the link under cursor
		{
			event = { Up = { streak = 1, button = 'Left' } },
			mods = 'CTRL',
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
