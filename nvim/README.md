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


