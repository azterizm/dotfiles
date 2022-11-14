local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>gp', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>gh', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<leader>sh', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', '<leader>pd', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', '<leader>rf', '<Cmd>Lspsaga rename<CR>', opts)
