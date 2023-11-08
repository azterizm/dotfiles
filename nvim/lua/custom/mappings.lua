---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>im"] = { "<cmd>OrganizeImports<CR>", "Organize Imports" },
  },
}

-- more keybinds!

return M
