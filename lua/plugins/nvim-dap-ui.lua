return {
    'rcarriga/nvim-dap-ui',
    config = function()
      require('dapui').setup({
        expand_lines = true,
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches"
            },
            size = 40,
            position = "right"
          }
        }
      })
      local dap, dapui = require('dap'), require('dapui')
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          dapui.open()
        end,
      })
    end,
    requires = {'mfussenegger/nvim-dap'}
}