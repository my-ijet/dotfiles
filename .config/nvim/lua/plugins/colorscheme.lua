return {
  -- {
  --   "xiyaowong/transparent.nvim",
  --   lazy = false,
  -- },
  -- {
  --   "navarasu/onedark.nvim",
  --   opts = {
  --     -- style = "darker",
  --     transparent = true,
  --     lualine = {
  --       transparent = true, -- lualine center bar transparency
  --     },
  --   },
  -- },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = true,
      theme = "wave",
      transparent = true,
      -- terminalColors = true,
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Прозрачность номеров строк
          LineNr = { bg = "none" },
          CursorLine = { bg = "none" },
          CursorLineNr = { bg = "none" },
          SignColumn = { bg = "none" },
          FoldColumn = { bg = "none" },

          WinSeparator = { bg = "none", fg = theme.ui.bg_p2 },

          StatusLine = { bg = "none" },
        }
      end,
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    opts = {
      style = "night",
      transparent = true,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
