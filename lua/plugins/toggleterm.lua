return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = true,
  opts = {
    size = 15,
    open_mapping = '<leader>tt',
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    direction = 'float',
    shell = vim.o.shell,
    close_on_exit = true,
    float_opts = {
      border = 'curved',
      winblend = 0,
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
  },
}
