local options = {
    close_if_last_window = false, -- Keep neo-tree open
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
      }
    },
    window = {
        position = "left",
        width = 40,
        mappings = {
            ["<space>"] = "toggle_node",
            ["<cr>"] = "open",
            ["s"] = "open_vsplit",
            ["S"] = "open_split",
            ["t"] = "open_tabnew",
            ["C"] = "close_node",
            ["R"] = "refresh",
            ["a"] = "add",
            ["d"] = "delete",
            ["r"] = "rename",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["?"] = "show_help",
        }
    },
}

require('neo-tree').setup(options)
