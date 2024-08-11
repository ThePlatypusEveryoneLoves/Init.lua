return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        natural_order = true,
      },
      float = {
        -- Padding around the floating window
        padding = 6,
        max_width = 0,
        max_height = 0,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
      keymaps = {
        ['<CR>'] = 'actions.select',
        ['/'] = 'actions.close',
      },

      vim.keymap.set('n', '/', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' }),
    }
  end,
}
