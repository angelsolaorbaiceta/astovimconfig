return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = function(_, opts)
    if not opts.adapters then opts.adapters = {} end
    table.insert(opts.adapters, require("neotest-python")({
      dap = { justMyCode = false },
      args = { "--log-level", "DEBUG", "-v" },
      runner = "pytest",
    }))
  end,
}
