return function(opts)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function(args)
            vim.lsp.start({
                name = "basedpyright",
                cmd = { "basedpyright-langserver", "--stdio" },
                root_dir = vim.fs.root(args.buf, {
                    "pyproject.toml",
                    "setup.cfg",
                    "setup.py",
                    "requirements.txt",
                    "poetry.lock",
                    "Pipfile",
                    "pyrightconfig.json",
                    ".git",
                }) or vim.fn.getcwd(),
                filetypes = { "python" },
                on_attach = opts.on_attach,
                capabilities = opts.capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "standard",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            autoImportCompletions = true,
                        },
                    },
                },
            })
        end,
    })
end


