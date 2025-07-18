-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/abdiel/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?.lua;/home/abdiel/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?/init.lua;/home/abdiel/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?.lua;/home/abdiel/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/abdiel/.cache/nvim/packer_hererocks/2.1.1720049189/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gruvbox-material"] = {
    config = { "\27LJ\2\n�\2\0\0\3\0\15\0\0306\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\t\0'\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0B\0\2\1K\0\1\0\21gruvbox-material\16colorscheme\bcmd\tdark\15background\bopt,gruvbox_material_transparent_background#gruvbox_material_enable_italic\rmaterial\31gruvbox_material_forground(gruvbox_material_better_performance\vmedium gruvbox_material_background\6g\bvim\0" },
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["oklch-color-picker.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23oklch-color-picker\frequire\0" },
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/oklch-color-picker.nvim",
    url = "https://github.com/eero-lehtinen/oklch-color-picker.nvim"
  },
  ["outline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0004\2\0\0B\0\2\1K\0\1\0\nsetup\foutline\frequire\1\0\1\tdesc\19Toggle Outline\21<cmd>Outline<CR>\14<leader>o\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/outline.nvim",
    url = "https://github.com/hedyhli/outline.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["snacks.nvim"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/snacks.nvim",
    url = "https://github.com/folke/snacks.nvim"
  },
  ["supermaven-nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20supermaven-nvim\frequire\0" },
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/supermaven-nvim",
    url = "https://github.com/supermaven-inc/supermaven-nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["yazi.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\f\0\23\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0005\1\t\0\18\2\0\0005\4\n\0'\5\v\0'\6\f\0006\a\6\0009\a\r\a'\t\14\0\18\n\1\0005\v\15\0B\a\4\0A\2\3\1\18\2\0\0'\4\16\0'\5\17\0'\6\18\0006\a\6\0009\a\r\a'\t\14\0\18\n\1\0005\v\19\0B\a\4\0A\2\3\0016\2\6\0009\2\20\2)\3\1\0=\3\21\0026\2\6\0009\2\20\2)\3\1\0=\3\22\2K\0\1\0\17loaded_netrw\23loaded_netrwPlugin\6g\1\0\1\tdesc6Open the file manager in nvim's working directory\22<cmd>Yazi cwd<cr>\15<leader>pg\6n\1\0\1\tdesc\"Open yazi at the current file\nforce\15tbl_extend\18<cmd>Yazi<cr>\15<leader>pv\1\3\0\0\6n\6v\1\0\3\fnoremap\2\tdesc\5\vsilent\2\bset\vkeymap\bvim\fkeymaps\1\0\1\14show_help\t<f1>\1\0\2\25open_for_directories\1\fkeymaps\0\nsetup\tyazi\frequire\0" },
    loaded = true,
    path = "/home/abdiel/.local/share/nvim/site/pack/packer/start/yazi.nvim",
    url = "https://github.com/mikavilpas/yazi.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gruvbox-material
time([[Config for gruvbox-material]], true)
try_loadstring("\27LJ\2\n�\2\0\0\3\0\15\0\0306\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\t\0'\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0B\0\2\1K\0\1\0\21gruvbox-material\16colorscheme\bcmd\tdark\15background\bopt,gruvbox_material_transparent_background#gruvbox_material_enable_italic\rmaterial\31gruvbox_material_forground(gruvbox_material_better_performance\vmedium gruvbox_material_background\6g\bvim\0", "config", "gruvbox-material")
time([[Config for gruvbox-material]], false)
-- Config for: oklch-color-picker.nvim
time([[Config for oklch-color-picker.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23oklch-color-picker\frequire\0", "config", "oklch-color-picker.nvim")
time([[Config for oklch-color-picker.nvim]], false)
-- Config for: yazi.nvim
time([[Config for yazi.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\f\0\23\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0005\1\t\0\18\2\0\0005\4\n\0'\5\v\0'\6\f\0006\a\6\0009\a\r\a'\t\14\0\18\n\1\0005\v\15\0B\a\4\0A\2\3\1\18\2\0\0'\4\16\0'\5\17\0'\6\18\0006\a\6\0009\a\r\a'\t\14\0\18\n\1\0005\v\19\0B\a\4\0A\2\3\0016\2\6\0009\2\20\2)\3\1\0=\3\21\0026\2\6\0009\2\20\2)\3\1\0=\3\22\2K\0\1\0\17loaded_netrw\23loaded_netrwPlugin\6g\1\0\1\tdesc6Open the file manager in nvim's working directory\22<cmd>Yazi cwd<cr>\15<leader>pg\6n\1\0\1\tdesc\"Open yazi at the current file\nforce\15tbl_extend\18<cmd>Yazi<cr>\15<leader>pv\1\3\0\0\6n\6v\1\0\3\fnoremap\2\tdesc\5\vsilent\2\bset\vkeymap\bvim\fkeymaps\1\0\1\14show_help\t<f1>\1\0\2\25open_for_directories\1\fkeymaps\0\nsetup\tyazi\frequire\0", "config", "yazi.nvim")
time([[Config for yazi.nvim]], false)
-- Config for: outline.nvim
time([[Config for outline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0004\2\0\0B\0\2\1K\0\1\0\nsetup\foutline\frequire\1\0\1\tdesc\19Toggle Outline\21<cmd>Outline<CR>\14<leader>o\6n\bset\vkeymap\bvim\0", "config", "outline.nvim")
time([[Config for outline.nvim]], false)
-- Config for: supermaven-nvim
time([[Config for supermaven-nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20supermaven-nvim\frequire\0", "config", "supermaven-nvim")
time([[Config for supermaven-nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
