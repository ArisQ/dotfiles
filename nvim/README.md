# nvim config

TODOs & hints

## Common
- [X] 放在vim配置的关键字上，快捷键跳转到文档: K
- [X] 关闭其他窗口: CTRL-W o
- [ ] 竖屏分屏切换横屏
- [ ] 搜索project/cwd中文件的内容

## Terminal

- [ ] 禁止文件打开时 terminal窗口大小变动 `set winfixheight` `set noequalalways`

## Programing Language
syntax
completion/snippets
debug
definition/reference/implemention
view doc

## Go
- [ ] TODO 写函数自动，搜索package并自动导入  by lsp
- [ ] 修改struct以后，引用字段地方报错
- [ ] build/run 整个目录，而不是当前文件
* text object `if/af`: `dif daf vif yif`
* struct split/join by `gS gJ` (AndredRadev/splitjoin.vim)
* snippets


## 功能
* ui
    * file tree
    * buf list/tab
* completion

## Lua Script

https://neovim.io/doc/user/lua-guide.html

- lua script under `runtimepath/plugin/` will be run automatically on startup.
- lua script under `runtimepath/lua/` will be loaded on demand.


## needs from golang

1. QUICK FIX
2. :cnext :previous 快捷键
3. 光标在.vimrc的某行时，如何快速打开帮助，比如在autowrite上 `set autowrite`,
而不用输入:h autowrite
4. 自动转换标点符号，=> , (其他，中英混排时，如何确定标点)


