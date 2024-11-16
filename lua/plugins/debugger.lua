local debugger = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
  },
  config = function(_, opts)
    local dap = require "dap"
    local dapui = require "dapui"
    local dapuigo = require "dap-go"
    dap.set_log_level "INFO"
    dapui.setup(opts)
    dapuigo.setup()

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
  end,
}
return debugger
