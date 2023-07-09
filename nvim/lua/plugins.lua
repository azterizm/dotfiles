local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'sainnhe/gruvbox-material'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'lukas-reineke/indent-blankline.nvim'
  use "hrsh7th/nvim-cmp"
  use "quangnguyen30192/cmp-nvim-ultisnips"
  use 'SirVer/ultisnips'
  use 'terrortylor/nvim-comment'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'hrsh7th/cmp-nvim-lsp'
  use 'BurntSushi/ripgrep'
end)
