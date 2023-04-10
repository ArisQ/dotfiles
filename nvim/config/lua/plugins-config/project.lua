return function()
    require('project_nvim').setup{
        -- manual_mode = true,
        -- detection_methods = {'lsp', 'patterns'},
        detection_methods = {'patterns'},
        patterns = {
            '.git',
            '_darcs',
            '.hg',
            '.bzr',
            '.svn',
            'Makefile',
            'CMakeLists.txt',
            'go.mod',
            'package.json' ,
        },
    }
end

