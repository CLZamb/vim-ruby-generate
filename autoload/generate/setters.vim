echom 'Autoloading...'
function! generate#getter#Setter()
  let save_pos = getpos('.')
    let l:func = general#get_input()

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [[][k'
  let start_line_number = line('.')
  let l:getter = [
        \ '',
        \ 'def ' . l:func . '=(' . l:func . ')',
        \ '@' . l:func . ' = ' . l:func,
        \ 'end',
        \ ]
  call append(line('.'), l:getter)
  exec 'normal ' . (start_line_number+2) . 'GV' . len(start_line_number+4) . 'j='
  call setpos('.', save_pos)
endfunction
