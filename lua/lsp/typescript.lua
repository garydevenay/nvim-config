return function(opts)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "typescript",
        callback = function() 
            vim.lsp.start({
                name = "tsserver",
                cmd = { "typescript-language-server", "--stdio" },
                root_dir = vim.fn.getcwd(),
                filetypes = { "ts" },
                on_attach = function()
                    vim.lsp.semantic_tokens.start(bufnr, client.id)
                end,
            })
        end,
    })
end
