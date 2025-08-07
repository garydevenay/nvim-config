return function(opts)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "zig",
    callback = function()
      vim.lsp.start({
        name = "zls",
        cmd = { "zls" },
        root_dir = vim.fs.dirname(
          vim.fs.find({ "zls.json", ".git" }, { upward = true })[1]
        ),
        on_attach = opts.on_attach,
      })
    end,
  })
end


