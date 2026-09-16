local wezterm = require("wezterm")
local config = wezterm.config_builder()
local modules = {
  'config.font',
  'config.appearance',
  'config.window',
  'config.shell',
  'config.ssh_domains',
  'config.keybindings',
  'config.mouse'
}

for _, name in ipairs(modules) do
  local module = require(name)
  if module and module.apply then
    module.apply(config)
  end
end

return config
