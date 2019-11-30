# vim-gofmtmd

<img src="image/cover.png" width="640px"/>

vim-gofmtmd formats go source code block in Markdown. detects fenced code & formats code using gofmt.

## Requirements

[gofmtmd](https://github.com/po3rin/gofmtmd)

## Inatall

First of all, you should install gofmtmd.

```bash
go get github.com/po3rin/gofmtmd/cmd/gofmtmd
```

if you have not installed Go language. please install from release page.
https://github.com/po3rin/gofmtmd/releases

you can use plugin.

```vim
" ex) if you use vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin()
Plug 'po3rin/vim-gofmtmd' "add plugin here!!
let g:lsp_async_completion = 1
call plug#end()
```

and exec

```vim
:PlugInstall
```

## Usage

command

```bash
:GoFmtMd
```

If you want to run automatically when saved, edit .vimrc

```vim
" in .vimrc
autocmd! BufWritePost *.md : call gofmtmd#execFmt()
```

## TODO
Run on save
