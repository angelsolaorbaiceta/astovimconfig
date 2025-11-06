-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- Python
        "pyright",           -- Python LSP (language server)
        "ruff",              -- Python linter + formatter
        "debugpy",           -- Python debugger
        
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
