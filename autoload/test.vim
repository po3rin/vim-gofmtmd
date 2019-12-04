scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let v:errors = []

let s:vim = {}
let s:nvim = {}

function! s:vim.assert_equalfile(f1, f2) abort
  call assert_equalfile(a:f1, a:f2)
endfunction

function! s:nvim.assert_equalfile(f1, f2) abort
  let md1 = readfile(a:f1)
  let md2 = readfile(a:f2)
  call assert_equal(md1, md2)
endfunction

function! test#run() abort
    call gofmtmd#execFmt()
    sleep 2 "wait ...
    let editor = has('nvim') ? s:nvim : s:vim
    call editor.assert_equalfile("testdata/golden.md", "testdata/testdata.md")
    if len(v:errors) >= 1
        echo v:errors
        execute 'cq!'
    endif
        echo 'test success'
        execute 'qall!'
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
