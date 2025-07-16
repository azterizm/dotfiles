vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_forground = 'material'
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_transparent_background = 1
      vim.opt.background = 'dark'
      vim.cmd.colorscheme('gruvbox-material')
    end
  }

  use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })

  use "nvim-lua/plenary.nvim"
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }


  use {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {}
    end,
  }

use {
  "eero-lehtinen/oklch-color-picker.nvim",
  config = function()
    require("oklch-color-picker").setup({})
  end
}

  use {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  }

  use {
    "folke/snacks.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  use {
  "mikavilpas/yazi.nvim",
  requires = {
    "folke/snacks.nvim",
  },
  config = function()
    require("yazi").setup({
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    })

    -- Key mappings
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, desc = "" }

    -- Open yazi at the current file
    map({ "n", "v" }, "<leader>pv", "<cmd>Yazi<cr>", vim.tbl_extend("force", opts, { desc = "Open yazi at the current file" }))

    -- Open yazi in current working directory
    map("n", "<leader>pg", "<cmd>Yazi cwd<cr>", vim.tbl_extend("force", opts, { desc = "Open the file manager in nvim's working directory" }))

    vim.g.loaded_netrwPlugin = 1
     vim.g.loaded_netrw = 1 -- Uncomment if fully replacing netrw
  end
}

end)
