" vim-gofmtmd
" Author: po3rin

scriptencoding utf-8

if !exists('g:loaded')
    finish
endif
let g:loaded = 1

let s:save_cpo = &cpo
set cpo&vi

function! s:reload_changed() abort
  " reload all files to reflect the new changes. We explicitly call
  " checktime to trigger a reload of all files. See
  " http://www.mail-archive.com/vim@vim.org/msg05900.html for more info
  " about the autoread bug
  let current_autoread = &autoread
  set autoread
  silent! checktime
  let &autoread = current_autoread
endfunction

function! s:err_cb(ch, msg) abort
	echoerr a:msg
endfunction

function! gofmtmd#execFmt() abort
  let cmd = ['gofmtmd', '-r', expand("%:p")]
  let op = {'err_cb': function('s:err_cb')}
  call job_start(cmd, op)
  call s:reload_changed()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et: