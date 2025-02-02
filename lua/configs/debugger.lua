local M = {}
local dap_go = require "configs.debugger.goadapter"
-- local dap_rust = require "configs.debugger.rust"

function M.setup_dap_and_dapui(opts)
  local dap = require "dap"
  local dapui = require "dapui"
  dap.set_log_level "INFO"
  dapui.setup(opts)

  -- Check if opts.open_in_tab is set, default to false
  local open_in_tab = true
  local dapui_tab = nil -- Store the tab number where DAP UI is opened

  local function open_dapui()
    if open_in_tab then
      vim.cmd "tabnew"
      dapui_tab = vim.fn.tabpagenr() -- Store the newly opened tab number
      vim.cmd "lua require('dapui').open()"
    else
      dapui.open {}
    end
  end

  local function close_dapui()
    if open_in_tab and dapui_tab then
      if vim.fn.tabpagenr() == dapui_tab then
        vim.cmd "tabclose"
      else
        vim.cmd(dapui_tab .. "tabnext | tabclose")
      end
      dapui_tab = nil -- Reset after closing
    else
      dapui.close {}
    end
  end

  dap.listeners.before.attach.dapui_config = function()
    open_dapui()
  end
  dap.listeners.before.launch.dapui_config = function()
    open_dapui()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    close_dapui()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    close_dapui()
  end
end

function M.setup(opts)
  M.setup_dap_and_dapui(opts)

  if vim.bo.filetype == "go" then
    dap_go.setup_adapter()
  end
end

return M
