local dap = { 
  "rcarriga/nvim-dap-ui", 
  depends = {"mfussenegger/nvim-dap"},
  config = function()
    require("dapui").setup()
  end
}


return dap
