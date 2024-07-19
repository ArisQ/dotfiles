
return function()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'c', 'lua', 'vim', 'help' },
        -- sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        },
    }

    -- tree-sitter-lox
    -- local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
    -- parser_config.lox = {
    --     install_info = {
    --         -- url = '~/Projects/metal-distributed-system/crafting-interpreters/tree-sitter-lox',
    --         url = '~/Projects/github/crafting-interpreters/tree-sitter-lox', -- local path or git repo
    --         files = {'src/parser.c'},
    --         generate_requires_npm = false,
    --         requires_generate_from_grammar = false,
    --     },
    -- }

end

