return function(opts)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "sql",
        callback = function()
            vim.lsp.start({
                name = "sql",
                cmd = { "sql-language-server", "up", "--method", "stdio" },
                root_dir = vim.fn.getcwd(),
                on_attach = function(client, bufnr)
                    vim.lsp.semantic_tokens.start(bufnr, client.id)
                end,
            })
        end
    })
end
