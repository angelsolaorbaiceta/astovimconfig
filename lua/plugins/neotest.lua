return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-golang",
  },
  opts = function(_, opts)
    if not opts.adapters then opts.adapters = {} end

    -- Python adapter
    table.insert(opts.adapters, require("neotest-python")({
      dap = { justMyCode = false },
      args = { "--log-level", "DEBUG", "-v" },
      runner = "pytest",
    }))

    -- Golang adapter
    table.insert(opts.adapters, require("neotest-golang")({
      go_test_args = {
        "-v",
        "-race",
        "-count=1",
        "-timeout=60s",
      },
      dap_go_enabled = true, -- Enable DAP debugging
    }))
  end,
}
