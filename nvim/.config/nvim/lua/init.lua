require 'plugins'

local telescope_builtin = require 'telescope.builtin'
local wk = require 'which-key'
wk.register({
    q = {'<cmd>q<cr>', 'Quit'},
    e = {'<cmd>NvimTreeToggle<cr>', 'File Explorer'},
    -- fl = {'<cmd>NvimTreeToggle<cr>', 'File Explorer'},
    f = {
        name = 'Telescope Find',
        -- f = {'<cmd>Telescope find_files<cr>', 'Find Files'},
        -- g = {'<cmd>Telescope live_grep<cr>', 'Live Grep'},
        -- b = {'<cmd>Telescope buffers<cr>', 'Buffers'},
        -- h = {'<cmd>Telescope help_tags<cr>', 'Help Tags'},
        f = {telescope_builtin.find_files, 'Find Files'},
        g = {telescope_builtin.live_grep, 'Live Grep'},
        b = {telescope_builtin.buffers, 'Buffers'},
        h = {telescope_builtin.help_tags, 'Help Tags'},
        p = {'<cmd>Telescope projects<cr>', 'Projects'},
        -- t = {telescope_builtin.treesitter, 'Tree Sitter'},
    },
    p = {
        name = 'Packer',
        i = {'<cmd>PackerInstall<cr>', 'Install'},
        c = {'<cmd>PackerCompile<cr>', 'Compile'},
    },
    -- golang
    g = {
        name = 'Golang',
        b = {'<cmd>GoBuild<cr>', 'Build'},
        r = {'<cmd>GoRun<cr>', 'Run'},
        tt = {'<cmd>GoTest<cr>', 'Test'},
        ta = {'<cmd>GoTest<cr>', 'Test'},
        tf = {'<cmd>GoTestFunc<cr>', 'Test'},
    },
    -- cmake
    m = {
        name = 'Make',
        r = {'<cmd>CMakeRun<cr>', 'CMake Run'},
    },
    -- rust
    r = {
        name = 'Rust',
        -- t = {'<cmd>!cargo run<cr>', 'Run'},
        r = {'<cmd>w<cr><cmd>terminal cargo run<cr>i', 'Run with terminal'},
    },
}, { prefix = '<Leader>' })

-- already done in plugins.lua
-- require 'plugins-config.mason'()

vim.filetype.add({
    extension = {
        lox = 'lox',
    },
})

-- local lspconfig = require 'lspconfig'
-- lspconfig.gopls.setup{
--     -- on_attach = require 'completion'.on_attach,
--     settings = {
--         gopls =  {
--             buildFlags =  {'-tags=wireinject'}
--         }
--     }
-- }

