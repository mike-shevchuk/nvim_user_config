return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },


  {
    "jiaoshijie/undotree",
    -- dependencies = "nvim-lua/plenary.nvim",
    keys = { -- load the plugin only when using it's keybinding
      "<leader>Tu", 
      "<cmd>lua require('undotree').toggle()<cr>",
      desc = "Toggle undotree"
    },
  config = function() require("undotree").setup() end,
  },



--   {
  --     "utilyre/barbecue.nvim",
  --     name = "barbecue",
  --     version = "*",
  --     dependencies = {
    --       "SmiteshP/nvim-navic",
    --       "nvim-tree/nvim-web-devicons", -- optional dependency
    --     },
    --     opts = {
      --     -- configurations go here
      --   },
      -- }


  {

    "https://github.com/itchyny/calendar.vim.git",
    -- "https://github.com/renerocksai/calendar-vim.git",
    -- config = function()
      --   require("calendar-vim").setup()
      -- end,
  },
} 


