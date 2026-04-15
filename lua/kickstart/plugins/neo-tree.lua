-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  event_handlers = {
    {
      event = 'file_open_requested',
      handler = function() require('neo-tree.command').execute { action = 'close' } end,
    },
  },
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
