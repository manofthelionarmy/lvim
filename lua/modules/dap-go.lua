require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go_headless",
      name = "Debug Connect Remote",
      mode = "remote",
      request = "attach",
      connect = {
        host = "localhost",
        port = "8181"
      },
    },
    -- NOTE: can't do local because we get the ptrace error
    {
      type = "go_headless",
      name = "Attach Remote",
      mode = "local",
      request = "attach",
      connect = {
        host = "127.0.0.1",
        port = "8181"
      },
    },
  },
  -- delve configurations
  delve = {
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "8181" -- I don't want this to start it, I want to attach to it
  },
}
