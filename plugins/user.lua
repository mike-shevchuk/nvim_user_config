return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --

  -- {
  -- "phaazon/hop.nvim",
  -- config = function()
  --   require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
  -- end,
  -- },


  -- {
  --   "phaazon/hop.nvim",
  --   enable = true,
  --   config = function()
  --     require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
  --     -- vim.api.nvim_set_keymap("n", "s", ":HopChar2<CR>", { silent = true })
  --     -- vim.api.nvim_set_keymap("n", "S", ":HopWord<CR>", { silent = true })
  --   end,
  -- },
  --
  --
  -- {
  --   'phaazon/hop.nvim',
  --   enable = true,
  --   branch = 'v2', -- optional but strongly recommended
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
  --   end,
  -- },


  -- Disabel standart plugin
  { "goolord/alpha-nvim", enabled = true },

  -- {
  --   'Exafunction/codeium.vim',
  --   event = 'BufEnter'
  -- },

  { "Mofiqul/dracula.nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    "lalitmee/cobalt2.nvim",
    event = { "ColorSchemePre" }, -- if you want to lazy load
    dependencies = { "tjdevries/colorbuddy.nvim" },
    init = function()
      require("colorbuddy").colorscheme("cobalt2")
    end,
  },

  -- {"ful1e5/onedark.nvim"},
  {'navarasu/onedark.nvim'},

  {'Tsuzat/NeoSolarized.nvim'},

  {"shaunsingh/solarized.nvim"},
  
  {
    "ahmedkhalf/jupyter-nvim",
    run = ":UpdateRemotePlugins",
    config = function()
    require("jupyter-nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
    end
  },


  {
    "folke/todo-comments.nvim",
    event = "User Astrofile",
	  config = true,
    
  },


  -- {
  --   'phaazon/hop.nvim',
  --   enable = true,
  --   branch = 'v2', -- optional but strongly recommended
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --   end
  -- },
}
