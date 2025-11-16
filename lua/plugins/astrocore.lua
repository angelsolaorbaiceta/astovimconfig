-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },

    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },

    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        scrolloff = 10, -- keep at least 10 lines visible below/above cursor
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },

    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- Test mappings (Neotest)
        ["<Leader>t"] = { desc = "Tests" },
        ["<Leader>tt"] = { function() require("neotest").run.run() end, desc = "Run nearest test" },
        ["<Leader>tf"] = { function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run test file" },
        ["<Leader>ta"] = { function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Run all tests" },
        ["<Leader>ts"] = { function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
        ["<Leader>to"] = { function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
        ["<Leader>tO"] = { function() require("neotest").output_panel.toggle() end, desc = "Toggle test output panel" },
        ["<Leader>tS"] = { function() require("neotest").run.stop() end, desc = "Stop nearest test" },
        ["<Leader>tw"] = { function() require("neotest").watch.toggle() end, desc = "Toggle test watch" },

        -- Debug mappings (DAP)
        ["<Leader>d"] = { desc = "Debugger" },
        ["<Leader>db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        ["<Leader>dB"] = { function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional breakpoint" },
        ["<Leader>dc"] = { function() require("dap").continue() end, desc = "Continue" },
        ["<Leader>di"] = { function() require("dap").step_into() end, desc = "Step into" },
        ["<Leader>do"] = { function() require("dap").step_over() end, desc = "Step over" },
        ["<Leader>dO"] = { function() require("dap").step_out() end, desc = "Step out" },
        ["<Leader>dq"] = { function() require("dap").terminate() end, desc = "Terminate" },
        ["<Leader>dr"] = { function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        ["<Leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle debugger UI" },
        ["<Leader>dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Hover" },

        -- Debug test mappings (Neotest + DAP)
        ["<Leader>td"] = { function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },
        ["<Leader>tD"] = { function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, desc = "Debug test file" },

        -- Go-specific debug mappings
        ["<Leader>dgt"] = { function() require("dap-go").debug_test() end, desc = "Debug Go test" },
        ["<Leader>dgl"] = { function() require("dap-go").debug_last_test() end, desc = "Debug last Go test" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
