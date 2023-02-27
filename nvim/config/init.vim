" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" 基础配置
" leader key / 快捷键
" mapleader需要在插件前
let mapleader = ";"
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

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

