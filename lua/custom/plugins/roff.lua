return {
  'Gavinok/vim-troff',
  config = function()
    vim.filetype.add {
      extension = {
        groff = 'troff',
      },
    }
  end,
}
