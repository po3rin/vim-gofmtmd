" vim-gofmtmd
" Author: po3rin

scriptencoding utf-8

if !exists('g:loaded')
    finish
endif
let g:loaded = 1

let s:save_cpo = &cpo
set cpo&vi

function! s:err_cb(ch, msg) abort
	echoerr a:msg
endfunction

function! gofmtmd#execFmt() abort
  let cmd = ['gofmtmd', '-r', '~/hi_dev/vim-gofmtmd/testdata/README.md']
  let op = {'err_cb': function('s:err_cb')}
  call job_start(cmd, op)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et: