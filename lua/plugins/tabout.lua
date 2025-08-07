return {
    {
    "abecodes/tabout.nvim",
    config = function()
        require("tabout").setup({
          tabkey = "", -- we'll handle it manually
          backwards_tabkey = "",
        })

        local ls = require("luasnip")

        local function replace_keycodes(str)
          return vim.api.nvim_replace_termcodes(str, true, true, true)
        end

        function _G.tab_binding()
          if vim.fn.pumvisible() ~= 0 then
            return replace_keycodes("<C-n>")
          elseif ls.expand_or_jumpable() then
            ls.expand_or_jump()
            return ""
          else
            return replace_keycodes("<Plug>(Tabout)")
          end
        end

        function _G.s_tab_binding()
          if vim.fn.pumvisible() ~= 0 then
            return replace_keycodes("<C-p>")
          elseif ls.jumpable(-1) then
            ls.jump(-1)
            return ""
          else
            return replace_keycodes("<Plug>(TaboutBack)")
          end
        end

        vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_binding()", { expr = true, noremap = true })
        vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_binding()", { expr = true, noremap = true })
      end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
    },
    opt = true,  
    event = 'InsertCharPre', 
    priority = 1000,
    },
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            return {}
        end,
    },
}
