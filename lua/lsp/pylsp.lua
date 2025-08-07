return function(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        vim.lsp.start({
            name = "pylsp",
            cmd = { "pylsp" },
            root_dir = vim.fn.getcwd(),
            on_attach = function(client, bufnr)
                vim.lsp.semantic_tokens.start(bufnr, client.id)
            end,
            pylsp = {
                plugins = {
                    pycodestyle = { enabled = false },
                    pylsp_mypy = { enabled = true },
                    jedi_completion = { fuzzy = true },
                    pyls_isort = { enabled = true },
                }
            }
        })
      end,
    })
end

