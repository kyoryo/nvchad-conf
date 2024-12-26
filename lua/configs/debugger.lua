local M = {}
local dap_go = require "configs.debugger.goadapter"
-- local dap_rust = require "configs.debugger.rust"

function M.setup_dap_and_dapui(opts)
  local dap = require "dap"
  local dapui = require "dapui"
  dap.set_log_level "INFO"
  dapui.setup(opts)

  -- automaticly open and close dap ui
  dap.listeners.before.attach.dapui_config = function()
    dapui.open {}
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open {}
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close {}
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close {}
  end
end

function M.setup(opts)
  M.setup_dap_and_dapui(opts)

  if vim.bo.filetype == "go" then
    dap_go.setup_adapter()
  end
end

return M
