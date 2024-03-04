return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },

  -- {
    --   'wellle/context.vim',
    --   config = function()
      --     require('context').setup({
        --       enable = true,
        --       max_lines = 1,
        --       patterns = {
          --         default = {
            --           'class',
            --           'function',
            --           'method',
            --           'for',
            --           'while',
            --           'if',
            --           'switch',
            --           'case',
            --         },
            --       },
            --     })
            --   end,
            -- },
            --

    -- FIXME: delete or rewright
    -- TODO: make better
    -- NOTE: don't forget
    -- INFO: don't care
    -- WARN: don't worry 
    {  
      "AmeerTaweel/todo.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    },

  -- NOTE:Check it
  { "folke/neodev.nvim", opts = {} },
  {
      "jiaoshijie/undotree",
      dependencies = "nvim-lua/plenary.nvim",
      config = true,
      keys = { -- load the plugin only when using it's keybinding:
      { "<leader>Tu", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },

  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup({
        mappings = {
          set_next = "m,",
          next = "m]",
          prev = "m[",
          delete_line = "m-",
          delete = "md",
          toggle = "m`",
          preview = "m:",
          set_bookmark0 = "m0",
          prev = false -- pass false to disable only this default mapping
        },
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { ".", "<", ">", "^" },
        -- whether movements cycle back and forth between rows
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions
        -- can be an interval
        refresh_interval = 250,
      })
    end

  },

  -- Rainbow Highlighting
  {
    "HiPhish/nvim-ts-rainbow2",
  },


  {"sindrets/diffview.nvim"},

  -- Plugin to diff different versions of a file
  {'will133/vim-dirdiff'},

  { 
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
    end
  },

  { 
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup({
        -- NOTE:Case 1
        -- enable = true, -- boolean: enable transparent
        -- extra_groups = { -- table/string: additional groups that should be cleared
        --   -- In particular, list your own choice of groups
        --   -- 'BufferLineTabClose',
        --   -- 'BufferlineBufferSelected',
        --   -- 'BufferLineFill',
        --   -- 'BufferLineBackground',
        --   -- 'BufferLineSeparator',
        --   -- 'BufferLineIndicatorSelected',
        -- },
        -- exclude = {}, -- table: groups you don't want to clear

        groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
      },
      extra_groups = {}, -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    })
    vim.cmd('TransparentDisable')
  end
  },

  { "CRAG666/code_runner.nvim", config = true },
  {
    "yorickpeterse/nvim-window",
    keys = {
      { "<leader>j", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
    },
    config = true,
  },

  {
    "nvim-pack/nvim-spectre", -- Better search and replace?
  },
  {
    "theHamsta/nvim-dap-virtual-text", -- Neovim DAP Virutal Text lol what else do you think this is?'
    build = ":TSUpdate",
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = true,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        filter_references_pattern = "<module>",
      })
    end,
  },

  -- sugestion panel automaticly 
  {
    'gelguy/wilder.nvim',
    config = function()
      require('wilder').setup({
        modes = { ':', '/', '?' },
      })
    end,
  },

  { 
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
      vim.keymap.set('n', '<C-w>z', ':WindowsMaximize<cr>')
      vim.keymap.set('n', '<C-w>V', ':WindowsMaximizeVertically<cr>')
      vim.keymap.set('n', '<C-w>H', ':WindowsMaximizeHorizontally<cr>')
      vim.keymap.set('n', '<C-w>=', ':WindowsEqualize<cr>')
    end
  },

  { 
    'willthbill/opener.nvim',
    config = function()
      require('telescope').load_extension("opener")
      require('telescope').setup({
        extensions = {
          opener = {
            use_telescope = true,
            hidden = true, -- do not show hidden directories
            root_dir = "~", -- search from home directory by default
            -- respect_gitignore = true, -- respect .gitignore files
          }
        }
      })
      require('opener').setup({
        pre_open = function(new_dir)
          print("Yay, opening " .. new_dir .. " in a moment")
        end,
        post_open = { "NeoTree", function(new_dir)
          print(new_dir .. " was opened")
        end },
      })
    vim.api.nvim_set_keymap('n', '<Leader>fd', ":Telescope opener<CR>", { noremap = true })
    end
  }, 



  -- {
    --   "haringsrob/nvim_context_vt",
    --   config = function()
      --     highlight = "ContextVtHighlight"
      --     text = "ContextVtText"
      --     -- highlight = "FloatTitle"
      --   end,
      -- },

  -- INFO: something strange
  {
    "phaazon/mind.nvim", -- Mind mapping/note taking
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
      vim.api.nvim_set_keymap(
      "n",
      "<C-n>",
      ':lua require("illuminate").goto_next_reference()<CR>',
      { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
      "n",
      "<C-N>",
      ':lua require("illuminate").goto_prev_reference()<CR>',
      { silent = true, noremap = true }
      )
    end,
  },

  {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },

    keys = {
      { "<leader>Ty", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
    },
  },

  { "https://github.com/itchyny/calendar.vim.git"},

  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim'
    }
  },
} 


