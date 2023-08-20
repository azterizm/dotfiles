vim.cmd [[highlight IndentBlanklineIndent guifg=#3b3b3b gui=nocombine]]

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = false,
  char_highlight_list = {
    "IndentBlanklineIndent",
  },
}
