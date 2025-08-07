local function default_on_attach(client, bufnr)
    local map = function(mode, keys, func)
        vim.keymap.set(mode, keys, func, { buffer = bufnr })
    end
  
    if client.server_capabilities.semanticTokensProvider and client.server_capabilities.semanticTokensProvider.full then
        vim.lsp.semantic_tokens.start(bufnr, client.id)
    end

    map("n", "gd", vim.lsp.buf.definition)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
end

vim.api.nvim_set_hl(0, "@lsp.type.class", { link = "Type" })
vim.api.nvim_set_hl(0, "@lsp.type.function", { link = "Function" })
vim.api.nvim_set_hl(0, "@lsp.type.parameter", { link = "Identifier" })
vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { link = "Type" })
vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "Identifier" })
vim.api.nvim_set_hl(0, "@lsp.type.keyword", { link = "Keyword" })

-- Expose shared options to other language modules
local M = {
  on_attach = default_on_attach,
}

vim.filetype.add({
  extension = {
    metal = "metal", 
  },
})

-- Load individual LSP configs
require("lsp.zig")(M)
require("lsp.pylsp")(M)
require("lsp.clangd")(M)
require("lsp.metal")(M)
require("lsp.rust")(M)
require("lsp.sql")(M)
require("lsp.typescript")(M)

return M

