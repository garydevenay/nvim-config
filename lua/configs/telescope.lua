local opts = {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = require('telescope.actions').move_selection_next,
                ["<C-p>"] = require('telescope.actions').move_selection_previous,
                ["<C-c>"] = require('telescope.actions').close,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        project = {
            base_dirs = {
                {'~/Documents/Projects', max_depth = 2},
            },
            hidden_files = true,
            order_by = "asc",
            theme = "dropdown",
            search_by = "title",
        },
    },
}

require "telescope".setup(opts)
require "telescope".load_extension('fzf')
require "telescope".load_extension('project')