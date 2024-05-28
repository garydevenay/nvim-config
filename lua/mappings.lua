require("nvchad.mappings")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- DAP keymaps
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts)
map("n", "<leader>di", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<leader>do", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<leader>dO", ":lua require'dap'.step_out()<CR>", opts)
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
map("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", opts)
map("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", opts)

-- Neotree keymaps
map("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Telescope keymaps
local builtin = require("telescope.builtin")

map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<C-p>", ":lua require'telescope'.extensions.project.project{}<CR>", opts)

map("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true, desc = "Goto Definiton" })
map("n", "gi", builtin.lsp_implementations, { noremap = true, silent = true, desc = "Goto Implementation" })
map("n", "gr", builtin.lsp_references, { noremap = true, silent = true, desc = "Goto References" })
map("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "View docs" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "Signature Help" })

-- Standard keymaps
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map(
	"n",
	"<leader>cfg",
	":e ~/.config/nvim/<CR>",
	{ noremap = true, silent = true, desc = "Open nvim configuration folder" }
)

-- Navigate buffers
map("n", "<Right>", ":bnext<CR>", opts)
map("n", "<Left>", ":bprevious<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)
