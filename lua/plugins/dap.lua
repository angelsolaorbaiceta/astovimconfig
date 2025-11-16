return {
  -- nvim-dap for debugging support
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- UI for nvim-dap
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {},
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)

          -- Automatically open/close dap-ui
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
      -- Virtual text for debugging
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
  },
  -- Go-specific DAP configuration
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-go").setup({
        -- Additional dap configurations can be added.
        delve = {
          -- the path to the executable dlv which will be used for debugging.
          path = "dlv",
          -- time to wait for delve to initialize the debug session.
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          port = "${port}",
          -- additional args to pass to dlv
          args = {},
          -- the build flags that are passed to delve.
          build_flags = "",
        },
      })
    end,
  },
}
