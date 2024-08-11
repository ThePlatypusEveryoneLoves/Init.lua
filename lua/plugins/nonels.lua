return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.pylint,
        null_ls.builtins.formatting.cmakelint,
      },
    }
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format code' })
  end,
}
