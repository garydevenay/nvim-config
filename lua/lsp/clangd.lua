return function(opts)
    local clangd_filetypes = {
        c = true,
        cpp = true,
        objc = true,
        objcpp = true,
        cuda = true,
    }

    vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
            local ft = vim.bo[args.buf].filetype
            if clangd_filetypes[ft] then
                vim.lsp.start({
                    name = "clangd",
                    cmd = { "clangd" },
                    root_dir = vim.fs.root(args.buf, { ".clangd", ".git" }) or vim.fn.getcwd(),
                    filetypes = vim.tbl_keys(clangd_filetypes),
                })
            end
        end,
    })
end

