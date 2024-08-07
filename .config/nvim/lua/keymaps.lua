local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("i", "\"", "\"\"<Left>", opts)
keymap("i", "(", "()<Left>", opts)
keymap("i", "{", "{}<Left>", opts)

--barbar 
keymap("n","<C-l>","<Cmd>setlocal relativenumber!<CR>",opts)
keymap("n", "<C-k>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<C-j>", "<Cmd>BufferNext<CR>", opts)
-- "keymap('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Attach key mappings for LSP functionalities",
  callback = function ()
    vim.keymap.set('n', 'gd', '<cmd>:lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set('n', 'gi', '<cmd>:lua vim.lsp.buf.implementation()<CR>')
    vim.keymap.set('n', 'K', '<cmd>:lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', 'gr', '<cmd>:lua vim.lsp.buf.references()<CR>')
    -- more mappings ...
  end
})

vim.keymap.set('n', 'ge', '<cmd>:lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '[d', '<cmd>:lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', ']d', '<cmd>:lua vim.diagnostic.goto_next()<CR>', opts)
