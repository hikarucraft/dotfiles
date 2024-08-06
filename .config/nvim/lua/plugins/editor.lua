return {
         {
           'lambdalisue/vim-fern',
           keys = {
             { "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=80<CR>", desc = "toggle fern" },
           },
           dependencies = {
             { 'lambdalisue/nerdfont.vim', },
             {
               'lambdalisue/fern-renderer-nerdfont.vim',
               config = function()
                 vim.g['fern#renderer'] = "nerdfont"
                 vim.g['fern#default_hidden'] = 1
               end
             },
           },
         },
         {
           'romgrk/barbar.nvim',
           dependencies = {
             'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
             'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
           },
           init = function() vim.g.barbar_auto_setup = false end,
           opts = {},
         }
}
