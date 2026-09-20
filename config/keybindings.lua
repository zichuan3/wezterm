local wezterm = require("wezterm")

local act = wezterm.action
local M = {}

function M.apply(config)
  config.keys = {
  { key = "q",          mods = "CTRL",       action = act.QuitApplication },
  { key = "n",          mods = "CTRL",       action = act.SpawnTab("DefaultDomain") },
  { key = "w",          mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = false }) },
  { key = "w",          mods = "CTRL",       action = act.CloseCurrentPane({ confirm = false }) },
  { key = "RightArrow", mods = "SHIFT",      action = wezterm.action({ ActivateTabRelative = 1 }) },
  { key = "LeftArrow",  mods = "SHIFT",      action = wezterm.action({ ActivateTabRelative = -1 }) },
  -- 调整标签页在标签栏中的顺序（焦点仍在当前标签）
  { key = "RightArrow", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },
  { key = "LeftArrow",  mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "RightArrow", mods = "ALT",        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "DownArrow",  mods = "ALT",        action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  -- 与neovim冲突了
  -- { key = "h", mods = "ALT", action = act.AdjustPaneSize({ "Left", 5 }) },
  -- { key = "j", mods = "ALT", action = act.AdjustPaneSize({ "Down", 5 }) },
  -- { key = "k", mods = "ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
  -- { key = "l", mods = "ALT", action = act.AdjustPaneSize({ "Right", 5 }) },
  -- 跳转窗口焦点
  { key = "LeftArrow",  mods = "CTRL",       action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CTRL",       action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "CTRL",       action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "CTRL",       action = act.ActivatePaneDirection("Down") },
  { key = "=",          mods = "CTRL",       action = act.IncreaseFontSize },
  { key = "-",          mods = "CTRL",       action = act.DecreaseFontSize },
  { key = "f",          mods = "CTRL",       action = act.Search({ CaseInSensitiveString = "" }) },
  { key = "n",          mods = "ALT",        action = act.ShowLauncher},
  { key = "F11",        mods = "NONE",       action = act.ToggleFullScreen },
  {
    key = ",",
    mods = "CTRL",
    action = act.ShowLauncherArgs({ flags = "FUZZY|TABS|LAUNCH_MENU_ITEMS" }),
  },
  {
    key = "C",
    mods = "CTRL|SHIFT",
    action = act.CopyTo 'ClipboardAndPrimarySelection',
  },
  {
    key = "v",
    mods = "CTRL",
    action = act.PasteFrom 'Clipboard',
  },
  {
    key = "V",
    mods = "CTRL|SHIFT",
    action = act.PasteFrom 'Clipboard',
  },
  {
    key = "N",
    mods = "CTRL|SHIFT",
    action = act.SplitHorizontal {
      args = { 'wezterm','connect','bpmpre'},
      domain = { DomainName = 'Local' },
    }
  }
}
end

return M



