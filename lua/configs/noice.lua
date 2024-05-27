local opts = {
    lsp = {
      hover = { enabled = false },
      signature = { enabled = false },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
}

require('noice').setup(opts)