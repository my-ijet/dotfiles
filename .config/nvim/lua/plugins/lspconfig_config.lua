return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = { enabled = false },

        -- Custom server definition for Zen C
        zenc_lsp = {
          cmd = { "zc-lsp" },
          filetypes = { "zenc" },
          root_markers = { "Makefile", "zenc.server.json", ".git" },
          single_file_support = true,
        },
      },
    },
  },
}
