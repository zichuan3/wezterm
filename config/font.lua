local wezterm = require("wezterm")
local M = {}

function M.apply(config)
  config.font = wezterm.font('JetBrainsMono Nerd Font',{ weight = 'Bold',italic = true})
  config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    "Cascadia Code",
    -- "CaskaydiaCove Nerd Font"
  }
  config.font_size = 13.0
  config.line_height = 1.2
end

return M
