return function(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "metal",
      callback = function()
        vim.cmd("set syntax=cpp") 
      end,
    })
end
