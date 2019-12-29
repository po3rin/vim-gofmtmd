" vim-gofmtmd
" Author: po3rin

scriptencoding utf-8

if exists('g:loaded_gofmtmd')
    finish
endif
let g:loaded_gofmtmd = 1

let s:save_cpo = &cpo
set cpo&vim

command! GoFmtMd :call gofmtmd#execFmt()

if get(g:, 'gofmtmd_auto_fmt', 0)
    augroup gofmtmd_autofmt
        autocmd!
        autocmd BufWritePost * if &ft == 'markdown' | :call gofmtmd#execFmt() | endif
    augroup END
endif

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
