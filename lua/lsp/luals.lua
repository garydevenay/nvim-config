return function(opts) 
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
      vim.lsp.start({
        name = "luals",
        cmd = { "lua-language-server" },
        root_dir = vim.fs.dirname(
          vim.fs.find({ ".luarc.json", ".luarc.jsonc" }, { upward = true })[1]
        ),
        on_attach = opts.on_attach,
      })
    end,
  })
end

