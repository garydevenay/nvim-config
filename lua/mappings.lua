require "nvchad.mappings"

local map = vim.keymap.set

-- DAP keymaps
map('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
map('n', '<leader>dc', ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
map('n', '<leader>di', ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
map('n', '<leader>do', ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
map('n', '<leader>dO', ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
map('n', '<leader>dr', ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true })
map('n', '<leader>dl', ":lua require'dap'.run_last()<CR>", { noremap = true, silent = true })
map('n', '<leader>du', ":lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })

-- Neotree keymaps
map('n', '<leader>e', ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Telescope keymaps
map('n', '<leader>ff', ":Telescope find_files<CR>", { noremap = true, silent = true })
map('n', '<leader>fg', ":Telescope live_grep<CR>", { noremap = true, silent = true })
map('n', '<leader>fb', ":Telescope buffers<CR>", { noremap = true, silent = true })
map('n', '<leader>fh', ":Telescope help_tags<CR>", { noremap = true, silent = true })
map('n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>", { noremap = true, silent = true })

-- Standard keymaps
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cfg", ":e ~/.config/nvim/<CR>", { noremap = true, silent = true, desc = "Open nvim configuration folder" })