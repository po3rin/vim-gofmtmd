scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! test#run()
    echo 'test success'
    execute 'qall!'
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo