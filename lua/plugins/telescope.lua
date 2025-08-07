return {
	"nvim-telescope/telescope.nvim", tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('telescope').setup {
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    grouped = true,
                    hidden = true,
                    previewer = false,
                    initial_mode = "normal",
                    layout_config = { height = 40 },
                }
            },
            defaults = {
                file_ignore_patterns = { "node_modules/", "dist/", "target/", "build/", "site-packages/" }
            }
        }

        require('telescope').load_extension 'file_browser'
    end
}
