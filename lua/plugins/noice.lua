return {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
        require "configs.noice"
    end,
    event = "VimEnter"
}
