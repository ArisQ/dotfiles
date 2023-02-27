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
}, { prefix = '<Leader>' })

require 'plugins-config.mason'()

