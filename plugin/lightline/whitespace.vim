if exists('g:loaded_lightline_whitespace')
  finish
endif
let g:loaded_lightline_whitespace = 1

augroup lightline_whitespace
    autocmd!
    autocmd CursorHold,BufWritePost * call <sid>ws_refresh()
augroup END

function! s:ws_refresh()
    if get(b:, 'lightline_ws_changedtick', 0) == b:changedtick
        return
    endif
    unlet! b:lightline_whitespace_check
    call lightline#update()
    let b:lightline_ws_changedtick = b:changedtick
endfunction
