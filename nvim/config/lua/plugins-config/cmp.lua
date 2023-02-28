return function()
    local cmp = require 'cmp'

    -- local lspkind = require("lspkind")
    cmp.setup {
        snippet = {
            expand = function(args)
                -- For `ultisnips` user.
                vim.fn['UltiSnips#Anon'](args.body)
            end,
        },
        -- mapping = cmp.mapping.preset.insert {
        --     ['<Tab>'] = function(fallback)
        --         if cmp.visible() then
        --             cmp.select_next_item()
        --         else
        --             fallback()
        --         end
        --     end,
        --     ['<S-Tab>'] = function(fallback)
        --         if cmp.visible() then
        --             cmp.select_prev_item()
        --         else
        --             fallback()
        --         end
        --     end,
        --     ['<CR>'] = cmp.mapping.confirm { select = true },
        --     ['<C-e>'] = cmp.mapping.abort(),
        --     ['<Esc>'] = cmp.mapping.close(),
        --     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        --     ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' }, -- For nvim-lsp
            { name = 'ultisnips' }, -- For ultisnips user.
            -- { name = 'path' }, -- for path completion
            -- { name = 'buffer', keyword_length = 2 }, -- for buffer word completion
            -- { name = 'emoji', insert = true }, -- emoji completion
            { name = 'cmdline' },
        }, {
            { name = 'path' }, -- for path completion
            { name = 'buffer' }, -- for buffer word completion
        }),
        mapping = {
            ["<Tab>"] = cmp.mapping({
                c = function()
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        cmp.complete()
                    end
                end,
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                        vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                    else
                        fallback()
                    end
                end,
                s = function(fallback)
                    if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                        vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                    else
                        fallback()
                    end
                end
            }),
            ["<S-Tab>"] = cmp.mapping({
                c = function()
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        cmp.complete()
                    end
                end,
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                        return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                    else
                        fallback()
                    end
                end,
                s = function(fallback)
                    if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                        return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                    else
                        fallback()
                    end
                end
            }),
            ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
            ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
            ['<C-n>'] = cmp.mapping({
                c = function()
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                    end
                end,
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end
            }),
            ['<C-p>'] = cmp.mapping({
                c = function()
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                    end
                end,
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end
            }),
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
            ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
            ['<CR>'] = cmp.mapping({
                i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                c = function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                    else
                        fallback()
                    end
                end
            }),
            -- ... Your other configuration ...
        },
        -- recommended configuration for <Tab> people:
        -- mapping = {
        --     ["<Tab>"] = cmp.mapping(
        --     function(fallback)
        --         cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        --     end,
        --     { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        --     ),
        --     ["<S-Tab>"] = cmp.mapping(
        --     function(fallback)
        --         cmp_ultisnips_mappings.jump_backwards(fallback)
        --     end,
        --     { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        --     ),
        -- },
    }
    --     mapping = cmp.mapping.preset.insert {
    --         ["<Tab>"] = function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_next_item()
    --             else
    --                 fallback()
    --             end
    --         end,
    --         ["<S-Tab>"] = function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_prev_item()
    --             else
    --                 fallback()
    --             end
    --         end,
    --         ["<CR>"] = cmp.mapping.confirm { select = true },
    --         ["<C-e>"] = cmp.mapping.abort(),
    --         ["<Esc>"] = cmp.mapping.close(),
    --         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --     },
    --     completion = {
    --         keyword_length = 1,
    --         completeopt = "menu,noselect",
    --     },
    --     view = {
    --         entries = "custom",
    --     },
    --     formatting = {
    --         format = lspkind.cmp_format {
    --             mode = "symbol_text",
    --             menu = {
    --                 nvim_lsp = "[LSP]",
    --                 ultisnips = "[US]",
    --                 nvim_lua = "[Lua]",
    --                 path = "[Path]",
    --                 buffer = "[Buffer]",
    --                 emoji = "[Emoji]",
    --                 omni = "[Omni]",
    --             },
    --         },
    --     },
    -- }

    -- cmp.setup.filetype("tex", {
    --     sources = {
    --         { name = "omni" },
    --         { name = "ultisnips" }, -- For ultisnips user.
    --         { name = "buffer", keyword_length = 2 }, -- for buffer word completion
    --         { name = "path" }, -- for path completion
    --     },
    -- })

    --  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
    -- vim.cmd([[
    -- highlight! link CmpItemMenu Comment
    -- " gray
    -- highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
    -- " blue
    -- highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
    -- highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
    -- " light blue
    -- highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
    -- highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
    -- highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
    -- " pink
    -- highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
    -- highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
    -- " front
    -- highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    -- highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
    -- highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
    -- ]])
    -- )

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['gopls'].setup {
        capabilities = capabilities
    }
    -- require('lspconfig')['go'].setup {
    --     capabilities = capabilities
    -- }

    -- Use cmdline & path source for ':'.
    cmp.setup.cmdline(':', {
        completion = { autocomplete = false },
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end
