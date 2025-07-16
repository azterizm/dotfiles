
local picker = require('oklch-color-picker')
vim.keymap.set('n', '<leader>v', function()
  picker.pick_under_cursor()
end)
