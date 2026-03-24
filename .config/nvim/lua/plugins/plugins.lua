return {
  {
    "lambdalisue/suda.vim",
    lazy = false,
    -- Настройка: автоматически просить sudo при чтении/записи защищенных файлов
    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      float = {
        padding = 2,
        max_width = 80,
        max_height = 30,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["q"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
      },
    },
    keys = {
      { "-", "<CMD>Oil --float<CR>", desc = "Open parent directory (Oil)" },
      { "<leader>fo", "<CMD>Oil --float<CR>", desc = "Open Oil" },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "alaviss/nim.nvim",
    ft = { "nim", "nims", "nimble" },
    config = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.opt.foldenable = false
        end,
      })
    end,
  },
  {
    "zenc-lang/zenc.vim",
    ft = "zenc",
  },

  -- {"teal-language/vim-teal",
  --  dependencies = {"dense-analysis/ale", "tpope/vim-endwise"}
  -- },
}
