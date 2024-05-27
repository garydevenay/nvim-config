return {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
        require "dap-go".setup()
    end,
    requires = "mfussenegger/nvim-dap"
}