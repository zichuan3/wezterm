local wezterm = require("wezterm")
local M = {}

function M.apply(config)
  config.color_scheme = "tokyonight_moon"
  config.freetype_render_target = "Normal"
  config.freetype_load_flags = "NO_HINTING"
  config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  config.window_background_opacity = 0.85
  config.adjust_window_size_when_changing_font_size = false

  config.initial_cols = 120
  config.initial_rows = 30

  config.colors = {
    tab_bar = {
      background = "rgba(12%, 12%, 18%, 95%)",
      active_tab = {
        bg_color = "#585b70",
        fg_color = "#cdd6f4",
        intensity = "Bold",
      },
      inactive_tab = {
        fg_color = "#bac2de",
        bg_color = "#313244",
      },
      inactive_tab_hover = {
        fg_color = "#cdd6f4",
        bg_color = "#414868",
      },
      new_tab = {
        fg_color = "#cdd6f4",
        bg_color = "#1f1f28",
      },
      new_tab_hover = {
        fg_color = "#cdd6f4",
        bg_color = "#181825",
      },
    },
  }
end

return M
