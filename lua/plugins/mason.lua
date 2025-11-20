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
        -- install language servers
        "pyright", -- Python LSP (language server)
        "ruff", -- Python linter + formatter
        "gopls", -- Go LSP
        "clangd", -- C LSP
        "lua-language-server", -- Lua LSP
        "buf", -- Protocol buffers LSP

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",
        "delve",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
