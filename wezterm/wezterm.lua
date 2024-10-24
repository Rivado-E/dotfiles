local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.keys = {
	{
		key = "Return",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "e",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.adjust_window_size_when_changing_font_size = false
config.colors = {
	background = "black",
	-- background = " #181818",
}

config.window_background_opacity = 0.69 + 0.0420 + 0.16 --[[ + 0.13 ]]
-- config.color_scheme = "One Dark (Gogh)"
-- config.color_scheme = "Vs Code Dark+ (Gogh)"
-- config.color_scheme = "Vs Code Dark+ (Gogh)"
config.color_scheme = "Tokyo Night"
config.font_size = 18
config.cursor_thickness = "4px"
config.font = wezterm.font_with_fallback({
	"IosevkaTerm Nerd Font",
})

config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}
config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"

return config
