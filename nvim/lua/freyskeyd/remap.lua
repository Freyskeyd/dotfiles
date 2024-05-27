vim.g.mapleader = ","

vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")
vim.keymap.set("v", ":", ":")

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', ';', '<cmd>FineCmdline<CR>', { noremap = true })
