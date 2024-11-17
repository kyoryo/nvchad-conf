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
    local dapgo = require "dap-go"
    dap.set_log_level "INFO"
    dapui.setup(opts)

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

    -- dap go setup
    dapgo.setup {
      dap_configurations = {
        {
          type = "go",
          name = "custom debug example",
          request = "launch",
          program = "${file}",
          buildFlags = require("dap-go").get_build_flags,
        },
      },
      -- delve configuration
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port.
        -- if you set a port in your debug configuration, its value will be
        -- assigned dynamically.
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        -- avaliable ui interactive function to prompt for arguments get_arguments
        build_flags = {},
        -- whether the dlv process to be created detached or not. there is
        -- an issue on Windows where this needs to be set to false
        -- otherwise the dlv server creation will fail.
        -- avaliable ui interactive function to prompt for build flags: get_build_flags
        detached = vim.fn.has "win32" == 0,
        -- the current working directory to run dlv from, if other than
        -- the current working directory.
        cwd = nil,
      },
      tests = {
        -- enable verbose when running test
        verbose = true,
      },
    }
  end,
}
return debugger
