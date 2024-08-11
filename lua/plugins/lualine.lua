return {
  'nvim-lualine/lualine.nvim',
  depenencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = require('tokyonight.colors').setup()
    require('lualine').setup {
      options = {
        theme = 'tokyonight',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
          'diff',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
              color_error = { fg = colors.red },
              color_warn = { fg = colors.yellow },
              color_info = { fg = colors.cyan },
              always_visible = true,
            },
          },
          '%=',
          {
            -- Lsp server name .
            function()
              local msg = 'No Active Lsp'
              local clients = vim.lsp.get_clients { bufnr = 0 }
              if next(clients) == nil then
                return msg
              else
                local _, client = next(clients)
                return client.config.name
              end
            end,
            icon = ' LSP:',
            color = { fg = '#ffffff', gui = 'bold' },
          },
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
