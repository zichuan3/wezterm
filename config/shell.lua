local wezterm = require("wezterm")
local M = {}

-- 走 ~/.ssh/config 里的 Host 别名
local ssh_hosts = {
  "ai_middle_app01",
  "ai_middle_app02",
  "ai_middle_git",
  "ai_middle_nginx",
  "ai_middle_redis",
  "Ubuntu-Server",
}

function M.apply(config)
  config.default_prog = { "nu" }

  local menu = {
    { label = "Nu",   args = { "nu.exe" } },
    { label = "CMD",  args = { "cmd.exe ", "/k" } },
    { label = "Pwsh", args = { "pwsh.exe ", "-NoLogo" } },
    { label = "Bash", args = { "bash.exe" } },
  }

  for _, host in ipairs(ssh_hosts) do
    menu[#menu + 1] = { label = "SSH: " .. host, args = { "ssh.exe", host } }
  end

  -- bpmpre 没写进 ~/.ssh/config，直接给密钥和地址
  menu[#menu + 1] = {
    label = "SSH: bpmpre",
    args = { "ssh.exe", "-i", "C:/Users/IT24/bpmpre_ssh_key", "root@172.20.255.108" },
  }

  config.launch_menu = menu
end

return M
