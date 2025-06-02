-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = {
	check_for_updates = false,
	font_size = 13,
	font = wezterm.font_with_fallback({
		{ family = "JetBrains Mono", weight = "Medium", harfbuzz_features = { "calt=0", "clig =0", "liga = 0" } },
	}),
	line_height = 1.1,
	color_scheme = "tokyonight_moon",
	-- tab_bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = true,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,
	-- scrollbar
	enable_scroll_bar = true,
	min_scroll_bar_height = "3cell",
	-- windows
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	integrated_title_button_color = "auto",
	integrated_title_button_alignment = "Right",
	window_padding = { left = 5, right = 10, top = 12, bottom = 7 },
	initial_cols = 120,
	initial_rows = 30,
	window_background_opacity = 0.85,
  disable_default_mouse_bindings = true,
	disable_default_key_bindings = true,
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
		{ key = "f", mods = "CTRL", action = act.Search({ CaseInSensitiveString = "" }) },
		{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
		{
			key = ",",
			mods = "CTRL",
			action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|TABS|LAUNCH_MENU_ITEMS" }),
		},
    {
      key = "C",
      mods = "CTRL|SHIFT",
      action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
    },
	},
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},
		-- move mouse will only select text and not copy text to clipboard
		{
			event = { Down = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.SelectTextAtMouseCursor("Cell"),
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.ExtendSelectionToMouseCursor("Cell"),
		},
		{
			event = { Drag = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.ExtendSelectionToMouseCursor("Cell"),
		},
		-- Turn on the mouse wheel to scroll the screen
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = act.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = act.ScrollByCurrentEventWheelDelta,
		},
	},
}

return config
