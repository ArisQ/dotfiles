require 'plugins'

local wk = require 'which-key'
wk.register({
    e = {'<cmd>NvimTreeToggle<cr>', 'File Explorer'},
    fl = {'<cmd>NvimTreeToggle<cr>', 'File Explorer'},
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
}, { prefix = '<Leader>' })

require 'plugins-config.mason'()

vim.filetype.add({
  extension = {
    lox = 'lox',
  },
})

