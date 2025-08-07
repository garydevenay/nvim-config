return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "python", "lua", "json", "zig", "go", "cpp", "typescript", "yaml", "sql" },
            highlight = { enable = true, additional_vim_regex_highlighting = true },
            indent = { enable = true },
        })
    end,
}
