
-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.vim]]

-- git config --global --add url."git@github.com:".insteadOf "https://github.com/"
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- ui
    use { 'tomasr/molokai' }
    use { 'vim-scripts/phd' }
    use { 'altercation/vim-colors-solarized' }
    -- use { 'nathanaelkane/vim-indent-guides' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    -- use { 'lukas-reineke/indent-blankline.nvim', config = function()
    --     -- require('indent_blankline').setup{
    --     require('ibl').setup{
    --         -- space_char_blankline = ' ',
    --         -- show_current_context = true,
    --         -- show_current_context_start = true,
    --         -- use_treesitter = true,
    --         show_first_indent_level = false,
    --     }
    -- end}

    use { 'tpope/vim-commentary', event = 'VimEnter', config = function()
        -- autocmd FileType apache setlocal commentstring=#\ %s
    end}

    use 'Lokaltog/vim-easymotion'

    -- :TSUpdate will cause Packer to fail upon the first installation.
    -- It will run correctly when updating.
    --
    -- To install parser, run
    -- :TSInstall <language_to_install>
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        run = ':TSUpdate',
        config = require 'plugins-config.treesitter',
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
	config = require 'plugins-config.tree',
    }

    use { 'folke/which-key.nvim', config = require 'plugins-config.which-key' }

    -- auto completion
    -- lsp
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- 'neovim/nvim-lspconfig',
        config = require 'plugins-config.mason'
    }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    -- For ultisnips users.
    use {
        'SirVer/ultisnips',
        -- requires = {{'honza/vim-snippets', rtp = '.'}},
        config = function()
            vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
            vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
            vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
            vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
            vim.g.UltiSnipsRemoveSelectModeMappings = 0
        end
    }
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use { 'hrsh7th/nvim-cmp', config = require 'plugins-config.cmp'}
    -- use { 'hrsh7th/nvim-cmp'}
    use { 'jose-elias-alvarez/null-ls.nvim', config = require 'plugins-config.null-ls' }

    -- debug
    use 'mfussenegger/nvim-dap'

    -- search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'ahmedkhalf/project.nvim',
        config = require 'plugins-config.project',
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    --[[

    -- auto-completion
    use { 'onsails/lspkind-nvim', event = 'VimEnter' }
    use { 'hrsh7th/nvim-cmp', after = 'lspkind-nvim', config = require 'plugins-config.cmp' } -- engine
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' } -- source
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
    -- use { 'hrsh7th/cmp-omni', after = 'nvim-cmp' }
    use { 'quangnguyen30192/cmp-nvim-ultisnips', after = { 'nvim-cmp', 'ultisnips' } }
    if vim.g.is_mac then use { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' } end

    -- Snippet engine and snippet template
    use { 'SirVer/ultisnips', event = 'InsertEnter' }
    use { 'honza/vim-snippets', after = 'ultisnips' }

    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use { 'neovim/nvim-lspconfig', after = 'cmp-nvim-lsp', config = require 'plugins-config.lsp' }
    --]]


    -- language specific
    use { 'fatih/vim-go', run = ':GoInstallBinaries' }

    use 'Civitasv/cmake-tools.nvim'
end)

