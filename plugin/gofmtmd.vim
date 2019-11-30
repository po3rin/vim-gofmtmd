" vim-gofmtmd
" Author: po3rin

scriptencoding utf-8

if exists('g:loaded_gofmtmd')
    finish
endif
let g:loaded_gofmtmd = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 GoFmtMd :call gofmtmd#execFmt()

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
