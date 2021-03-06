" vim-gofmtmd
" Author: po3rin

scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:vim = {}
let s:nvim = {}

function! s:vim.job_start(cmd, op) abort
  call job_start(a:cmd, a:op)
endfunction

function! s:nvim.job_start(cmd, op) abort
  call jobstart(a:cmd, a:op)
endfunction

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

function! s:echo_err(msg) abort
  echohl ErrorMsg | echomsg a:msg | echohl None
endfunction

" s:exit_cb reloads any changed buffers and then calls next.
function! s:exit_cb(job, exitval) abort
  call s:reload_changed()
endfunction

function! s:err_cb(ch, msg) abort
	call s:echo_err(a:msg)
endfunction

function! gofmtmd#execFmt() abort
  " if file type is 'markdown', execute command
  if &ft is# 'markdown'
    let cmd = 'gofmtmd'
    if !executable(cmd)
      call s:echo_err('not found gofmtmd, please install https://github.com/po3rin/gofmtmd')
      return
    endif
    let op = {'err_cb': function('s:err_cb'), 'exit_cb': function('s:exit_cb')}
    let editor = has('nvim') ? s:nvim : s:vim
    call editor.job_start([cmd, '-r', expand("%:p")], op)
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
