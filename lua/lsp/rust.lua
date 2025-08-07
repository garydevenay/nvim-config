return function(opts)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
            vim.lsp.start({
                name = "rust-analyzer",
                cmd = { "rust-analyzer" },
                root_dir = vim.fs.dirname(
                    vim.fs.find({ "Cargo.toml", ".git" }, { upward = true })[1]
                ),
                on_attach = opts.on_attach,
                capabilities = opts.capabilities,
            })
        end,
    })
end
