local map = vim.keymap.set
local opts = { noremap = true }

-- Global
map("n", ";", ":", opts)

-- Lazy
map("n", "<leader>lz", ":Lazy<CR>", opts)
map("n", "<leader>rr", ":Lazy reload<CR>", opts)

-- Navigate buffers
map("n", "<Right>", ":bnext<CR>", opts)
map("n", "<Left>", ":bprevious<CR>", opts)
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-h>", ":wincmd h<CR>", opts)
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)
map("n", "<Leader>x", ":bd<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", function()
    require("telescope").extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.fn.expand("%:p:h"),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
    })
end, opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<C-p>", ":lua require'telescope'.extensions.project.project{}<CR>", opts)
map("n", "<leader>td", ":TodoTelescope<CR>", opts)

-- lsp
map("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
