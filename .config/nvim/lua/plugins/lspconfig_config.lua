return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        nim_langserver = {},
        basedpyright = {},
        bashls = { enabled = false },
      },
    },
  },
}
