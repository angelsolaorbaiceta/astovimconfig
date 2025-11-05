 return {
   "linux-cultist/venv-selector.nvim",
   dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
   opts = {
      search = {}, -- if you add your own searches, they go here.
      options = {} -- if you add plugin options, they go here.
   },
   ft = "python", -- Load when opening Python files
   keys = {
     { "<leader>lv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
   },
 }
