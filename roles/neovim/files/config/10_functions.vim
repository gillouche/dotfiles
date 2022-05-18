" Search for the next line with the same indention (nice for finding start/end
" of blocks)
function! MatchIndent(direction)
    if a:direction != 'f' && a:direction != 'b'
        echoe "MatchIndent only accepts one of two arguments, 'f' or 'b'."
        return
    endif

    "Get the current line into a register.
    "normal "xyy
    let @x = getline(line('.'))

    let indent_char = '\t'
    if &expandtab
        let indent_char = ' '
    endif
    let indent_pattern = '^\(' . indent_char . '*\)[^' . indent_char . ']'

    " Get physical indent.
    let indent = matchlist(@x, indent_pattern)

    let search_flags = 'n'
    if !empty(a:direction) && a:direction == 'b'
        " Set the search flags to include 'backwards'.
        let search_flags .= 'b'
        " Move the cursor up one line so reverse search doesn't match the 
        " current line.
        call cursor(line('.') - 1, col('.'))
    endif

    if !empty(indent)
        let next_matching_line = search(
                '^' . indent_char . '\{' . len(indent[1]) . '}[^' . 
                indent_char . ']', search_flags
            )
        "execute "normal /" . '^\t\{' . len(b:indent[1]) . '}[^\t]' . "\<CR>"
        if next_matching_line
            call cursor(next_matching_line, 0)
        else
            if a:direction == 'b'
                call cursor(line('.') + 1, col('.'))
            endif
        endif
    endif
endfun
nmap <leader>if :call MatchIndent('f')<CR>
nmap <leader>ib :call MatchIndent('b')<CR>

" vim: set et ts=4 sw=4 :
