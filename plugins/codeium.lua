return {
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
