local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("i", "\"", "\"\"<Left>", opts)
keymap("i", "(", "()<Left>", opts)
keymap("i", "{", "{}<Left>", opts)

--barbar 
keymap("n","<C-l>","<Cmd>setlocal relativenumber!<CR>",opts)
keymap("n", "<C-k>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<C-j>", "<Cmd>BufferNext<CR>", opts)
keymap('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
