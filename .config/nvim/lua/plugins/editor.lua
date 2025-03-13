return{         
        {
           'lambdalisue/vim-fern',
           keys = {
             { "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=55<CR>", desc = "toggle fern" },
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
         },
         { "neovim/nvim-lspconfig" },
         { "williamboman/mason.nvim" },
         { "williamboman/mason-lspconfig.nvim" },
         { "hrsh7th/nvim-cmp" },
         { "hrsh7th/cmp-nvim-lsp" },
         { "hrsh7th/cmp-buffer" },
         { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
         { "MunifTanjim/prettier.nvim" },
         {
           "nvim-treesitter/nvim-treesitter",
           build = ":TSUpdate",
           --config = function () 
           --  local configs = require("nvim-treesitter.configs")

           --  configs.setup({
           --      ensure_installed = "all",
           --      sync_install = false,
           --      highlight = { enable = true },
           --      indent = { enable = true },  
           --    })
           --end
         },
         {'christianchiarulli/nvcode-color-schemes.vim'},
         {
	       	"craftzdog/solarized-osaka.nvim",
	       	lazy = true,
	       	priority = 1000,
	       	opts = function()
	       		return {
	       			transparent = true,
	       		}
	       	end,
	       },
         { 
          "EdenEast/nightfox.nvim",
          opts = {
            options = {
              transparent = true, -- 背景を透明にする
              terminal_colors = true,
              dim_inactive = true,
            },
          },
          config = function(_, opts)
            -- Nightfoxの設定を適用
            require("nightfox").setup(opts)
            vim.cmd("colorscheme nightfox") -- カラースキームを適用
          end,
         },
}
