local wezterm = require("wezterm")

local M = {}

function M.apply(config)
  -- tab_bar
  config.enable_tab_bar = true
  config.hide_tab_bar_if_only_one_tab = true
  config.use_fancy_tab_bar = true
  config.tab_max_width = 5
  config.switch_to_last_active_tab_when_closing_tab = true
  -- scrollbar
  config.enable_scroll_bar = true
  config.scrollback_lines = 3600

  config.disable_default_mouse_bindings = true
  config.disable_default_key_bindings = true

  config.check_for_updates = false
  config.front_end = "WebGpu"
  config.show_tab_index_in_tab_bar = false
  config.integrated_title_button_color = "auto"

  -- 窗口内部区域(不含标题栏/边框)设为 1524 x 900 px
  -- 用 window-config-reloaded:窗口创建和配置重载都会触发,
  -- gui-startup 时机窗口尚未创建, gui_windows() 为空会空转
  wezterm.on('window-config-reloaded', function(window, _)
    local dims = window:get_dimensions()
    if dims and (dims.pixel_width ~= 1524 or dims.pixel_height ~= 900) then
      window:set_inner_size(1524, 900)
    end
  end)
end

return M
