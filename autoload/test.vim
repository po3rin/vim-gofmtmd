scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let v:errors = []

function! test#run() abort
    call gofmtmd#execFmt()
    sleep 3 "wait ...
    call assert_equalfile("testdata/golden.md", "testdata/testdata.md")
    if len(v:errors) >= 1
        echo v:errors
        execute 'cq!'
    endif
        echo 'test success'
        execute 'qall!'
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
