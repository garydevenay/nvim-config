return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = function()
      -- Ensure devicons are loaded
      require "configs.nvim-web-devicons"
      -- Configuration for neo-tree
      require "configs.neo-tree"

      -- Disable line numbers in neo-tree window
      vim.cmd([[
        autocmd FileType neo-tree setlocal nonumber norelativenumber
      ]])

      -- Auto open neo-tree when opening Neovim
      vim.cmd([[
        autocmd VimEnter * Neotree show left
      ]])
    end,
    lazy = false, -- Ensure the plugin is not lazily loaded
    priority = 1000, -- Ensure it loads early
}
