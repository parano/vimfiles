" emacs keybinding
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
"imap <M-b> <C-o>b
"imap <M-f> <C-o>e<Right>
imap <C-d> <Del>
"imap <C-h> <BS>
"imap <M-d> <C-o>de
"imap <M-h> <C-w>
imap <C-k> <C-r>=<SID>kill_line()<CR>

function! s:home()
    let start_col = col('.')
    normal! ^
    if col('.') == start_col
        normal! 0
    endif
    return ''
endfunction

function! s:kill_line()
    let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
    if len(text_after_cursor) == 0
        normal! J
    else
        call setline(line('.'), text_before_cursor)
    endif
    return ''
endfunction

function! s:split_line_text_at_cursor()
    let line_text = getline(line('.'))
    let text_after_cursor  = line_text[col('.')-1 :]
    let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
    return [text_before_cursor, text_after_cursor]
endfunction


