-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = {
	check_for_updates = false,
	font_size = 13,
	font = wezterm.font_with_fallback({
		{ family = "JetBrains Mono", weight = "Medium", harfbuzz_features = { "calt=0", "clig =0", "liga = 0" }, },
	}),
	line_height = 1.1,
	color_scheme = "tokyonight_moon",
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	enable_scroll_bar = true,
	show_tab_index_in_tab_bar = false,
	window_padding = { left = 0, right = 15, top = 0, bottom = 0 },
	window_background_opacity = 0.85,
	disable_default_key_bindings = true,
	initial_cols = 120,
	initial_rows = 30,
	default_prog = { "cmd" },
	launch_menu = {
		{ label = "CMD", args = { "cmd.exe ", "/k" } },
		{ label = "Pwsh", args = { "pwsh.exe ", "-NoLogo" } },
		{ label = "Bash", args = { "bash.exe" } },
		{ label = "Nu", args = { "nu.exe" } },
	},
	colors = {
		tab_bar = {
			background = "rgba(12%, 12%, 18%, 90%)",
			active_tab = {
				bg_color = "#585b70",
				fg_color = "#cdd6f4",
			},
			inactive_tab = {
				fg_color = "#bac2de",
				bg_color = "#313244",
			},
			inactive_tab_hover = {
				fg_color = "#cdd6f4",
				bg_color = "#313244",
			},
			new_tab = {
				fg_color = "#cdd6f4",
				bg_color = "#1f1f28",
			},
			new_tab_hover = {
				bg_color = "#181825",
				fg_color = "#cdd6f4",
			},
		},
	},
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelection("ClipboardAndPrimarySelection"),
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},
	},
	keys = {
		{ key = "q", mods = "CTRL", action = act.QuitApplication },
		{ key = "n", mods = "CTRL", action = act.SpawnTab("DefaultDomain") },
		{ key = "w", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
		{ key = "w", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },
		{ key = "RightArrow", mods = "SHIFT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "LeftArrow", mods = "SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "RightArrow", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "DownArrow", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- 与neovim冲突了
		-- { key = "h", mods = "ALT", action = act.AdjustPaneSize({ "Left", 5 }) },
		-- { key = "j", mods = "ALT", action = act.AdjustPaneSize({ "Down", 5 }) },
		-- { key = "k", mods = "ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
		-- { key = "l", mods = "ALT", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "LeftArrow", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "RightArrow", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "UpArrow", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "f", mods = "CTRL", action = "QuickSelect" },
		{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
		{
			key = ",",
			mods = "CTRL",
			action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|TABS|LAUNCH_MENU_ITEMS" }),
		},
	},
}

return config
