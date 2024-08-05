local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap


keymap("i", "\"", "\"\"<Left>", opts)
keymap("i", "(", "()<Left>", opts)
keymap("i", "{", "{}<Left>", opts)

keymap("n","<C-l>",":<C-u>setlocal relativenumber!<CR>",opts)
