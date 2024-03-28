local gpt4 = {
  "jackMort/ChatGPT.nvim",
  dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
  },
  -- enable = true,
  event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
      api_key_cmd = "bw get notes openai",
      -- api_key_cmd = {"bw", "get", "notes", "openai"},
      openai_params = {
          model = "gpt-3.5-turbo-instruct",
          max_tokens = 8192,
        },
      openai_edit_params = {
        model = "gpt-3.5-turbo-instruct",
        max_tokens = 128000,
      },
    })
    end,

}

local gpt3 = {
  "robitx/gp.nvim",
  config = function()
		require("gp").setup({

      openai_api_key = {"bw", "get", "notes", "openai"},

		})

		-- or setup with your own config (see Install > Configuration in Readme)
		-- require("gp").setup(config)

        	-- shortcuts might be setup here (see Usage > Shortcuts in Readme)
	end,
}


local codeium_nvim = {
    "Exafunction/codeium.nvim",
    -- event = "BufEnter",
    -- enable = true,
    -- lazzy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({})
    end,
}

local codeium_vim =  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
}



return {gpt4, gpt3, codeium_nvim, codeium_vim}
