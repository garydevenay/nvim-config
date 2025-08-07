return {
    "saghen/blink.cmp",
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    version = "1.2.0",
    opts = {
        snippets = { preset = "luasnip" },
        keymap = { 
            ['<CR>'] = { 'accept', 'fallback' },
            ['<Tab>'] = { 'accept', 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' }
        },
        appearance = {
          nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = false } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
