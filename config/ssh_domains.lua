local wezterm = require("wezterm")

local M = {}

function M.apply(config)
  config.ssh_backend = "Ssh2"
  config.ssh_domains = {
    {
      name = "bpmpre",
      remote_address = "172.20.255.108",
      username = "root",
      multiplexing = 'None',
      ssh_option ={
        identityfile = 'C:/Users/IT24/bpmpre_ssh_key' 
      },
    },
  }
end

return M
