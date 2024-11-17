local options = {
  timeout = 3000, -- try to close go test result notification after 3s.
  keep = function() -- decide whether to keep the notification after timeout(3s).
    return false
  end,
  render = "default", -- default / minimal / simple / compact, controls the notification style.
  test_args = "-v -race", -- these args will be passed to go test command at any time.
}

require("gott").setup(options)
