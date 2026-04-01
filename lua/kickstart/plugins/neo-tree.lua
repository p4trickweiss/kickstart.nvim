-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = true, -- show hidden files (dimmed)
          hide_dotfiles = false, -- don't hide dotfiles
          hide_gitignored = false,
          hide_by_name = {},
          never_show = { '.git' },
        },
        window = {
          mappings = {
            ['<leader>e'] = 'close_window',
          },
        },
      },
    }
  end,
}
