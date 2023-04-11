" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" 基础配置
" leader key / 快捷键
" mapleader需要在插件前
let mapleader = ";"
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 插件安装，为其他功能服务，使用 packer
" https://github.com/wbthomason/packer.nvim
" why packer instead of plug: 配置和插件放在一起
" lua require('plugins')
lua require 'init'

" 基础配置 after


" UI美化
" font: family/size
" color scheme
" nerd font icon
" set background=light
" colorscheme solarized
colorscheme molokai
" colorscheme phd
" colorscheme desert
" colorscheme evening
" highlight NvimTreeGitIgnored guifg=red gui=bold,underline

" UI增强
" Project/fold view
" tab bar
" embed terminal / REPL
" set ruler
set number
set cursorline
set cursorcolumn
set sw=4
set expandtab

" 功能增强
" easymotion
" undo history/tree
" tab mode
" draw it / flowchart
" session

" Programing Language: 通用配置 + 语言单独配置
" go/c++/markdown/vue+js+ts+css+html/
" syntax
" snippets
" completion
" jump definition/reference/implement
" view doc
" build/run/debug
" toggle comment
"
" git: diff/history/graph




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre *.go GoImports
nnoremap <leader>gb :GoBuild<CR>
nnoremap <leader>gr :GoRun<CR>
nnoremap <leader>gt :GoTest<CR>

" bad
nnoremap <leader>gtf :GoTestFunc<CR>

" https://github.com/fatih/vim-go/wiki/Tutorial
autocmd FileType go nmap<leader>b <Plug>(go-build)
autocmd FileType go nmap<leader>r <Plug>(go-run)
" autocmd FileType go nmap<leader>t <Plug>(go-test)
autocmd FileType go nmap<leader>tt <Plug>(go-test)
autocmd FileType go nmap<leader>tf <Plug>(go-test-func)
autocmd FileType go nmap<leader>tc <Plug>(go-test-compile)
" autocmd FileType go nmap<leader>c <Plug>(go-coverage)
" autocmd FileType go nmap<leader>c <Plug>(go-coverage-cleaner)
" autocmd FileType go nmap<leader>c <Plug>(go-coverage-browser)
autocmd FileType go nmap<leader>c <Plug>(go-coverage-toggle)
set autowrite " autowrite when :make
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" let g:go_fmt_autosave = 0
" let g:go_fmt_command = "goimports"  " default gopls
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
"

" c/c++ commentary
" TODO to lua
autocmd FileType cpp setlocal commentstring=//\ %s
