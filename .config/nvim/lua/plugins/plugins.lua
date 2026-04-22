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
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "html",
        "css",
        "json",
        "yaml",
        "kdl",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "desktop",
        "lua",
        "python",
        "nim",
        "nim_format_string",
        "bash",
        "zsh",
        "make",
        "cmake",
        "c",
        "cpp",
        "glsl",
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
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

  -- {"teal-language/vim-teal",
  --  dependencies = {"dense-analysis/ale", "tpope/vim-endwise"}
  -- },

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
  {
    "ej-shafran/compile-mode.nvim",
    -- version = "^5.0.0",
    -- you can just use the latest version:
    -- branch = "latest",
    -- or the most up-to-date updates:
    -- branch = "nightly",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- if you want to enable coloring of ANSI escape codes in
      -- compilation output, add:
      {
        "m00qek/baleia.nvim",
        -- tag = "v1.3.0"
      },
    },
    config = function()
      ---@type CompileModeOpts
      vim.g.compile_mode = {
        -- if you use something like `nvim-cmp` or `blink.cmp` for completion,
        -- set this to fix tab completion in command mode:
        -- input_word_completion = true,
        -- to add ANSI escape code support, add:
        -- baleia_setup = true,
        -- to make `:Compile` replace special characters (e.g. `%`) in
        -- the command (and behave more like `:!`), add:
        -- bang_expansion = true,
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.configurations.zenc = dap.configurations.c
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>de",
        function()
          require("dapui").eval(nil, { enter = true })
        end,
        desc = "Eval (with focus)",
      },
    },
  },
  {
    "jake-stewart/multicursor.nvim",
    lazy = false,
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set
      -- Add a cursor for all matches of cursor word/selection in the document.
      set({ "n", "x" }, "<leader>A", mc.matchAllAddCursors)

      -- Append/insert for each line of visual selections.
      -- Similar to block selection insertion.
      set("x", "I", mc.insertVisual)
      set("x", "A", mc.appendVisual)

      -- Jump to the next/previous search result without adding a cursor.
      set("n", "<leader>as", function()
        mc.searchSkipCursor(1)
      end)
      set("n", "<leader>aS", function()
        mc.searchSkipCursor(-1)
      end)

      -- Add a cursor to every search result in the buffer.
      set("n", "<leader>aA", mc.searchAllAddCursors)

      -- Add or skip cursor above/below the main cursor.
      set({ "n", "x" }, "<c-up>", function()
        mc.lineAddCursor(-1)
      end)
      set({ "n", "x" }, "<c-down>", function()
        mc.lineAddCursor(1)
      end)
      set({ "n", "x" }, "<leader><up>", function()
        mc.lineSkipCursor(-1)
      end)
      set({ "n", "x" }, "<leader><down>", function()
        mc.lineSkipCursor(1)
      end)

      -- Add or skip adding a new cursor by matching word/selection
      -- set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end)
      set({ "n", "x" }, "<leader>N", function()
        mc.matchAddCursor(1)
      end)

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ "n", "x" }, "<c-q>", mc.toggleCursor)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },

  -- {
  --   "Olical/conjure",
  --   ft = { "fennel", "python" },
  --   lazy = true,
  --   init = function()
  --     -- Set configuration options here
  --     -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
  --     -- This is VERY helpful when reporting an issue with the project
  --     -- vim.g["conjure#debug"] = true
  --     -- vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
  --     -- vim.g["conjure#client#guile#socket#pipename"] = "/tmp/guile-repl.socket"
  --   end,
  --
  --   -- Optional cmp-conjure integration
  --   dependencies = { "PaterJason/cmp-conjure" },
  -- },
  -- {
  --   "PaterJason/cmp-conjure",
  --   lazy = true,
  --   config = function()
  --     local cmp = require "cmp"
  --     local config = cmp.get_config()
  --     table.insert(config.sources, { name = "conjure" })
  --     return cmp.setup(config)
  --   end,
  -- },
}
