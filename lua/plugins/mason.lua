return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "gopls",
            "lua-language-server",
            "stylua",
            "html-lsp",
            "css-lsp" ,
            "prettier"
        },
    },
}