-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.opt.shortmess = 'I'
vim.opt.cursorline = false
if vim.g.neovide == true then
  -- vim.cmd 'set guifont=Hack\ NF:h10'
  -- vim.o.guifont='Consolas:h10'
  -- vim.o.guifont='FiraCode NF:h14'
  -- vim.o.guifont='Operator Mono,FiraCode NF:h14'
  vim.api.nvim_set_keymap('n', '<F11>', ':let g:neovide_fullscreen = !g:neovide_fullscreen<CR>', {})
end
require('nvim-treesitter.configs').setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = 'v',
      node_decremental = 'V',
    },
  },
}
return {}
