echom 'Autoloading...'
function! generate#setter#Setter()
  let save_pos = getpos('.')
  try
    let l:func = general#get_input()
  catch
    echo v:exception
    return
  endtry

  :call general#go_to_position(g:ruby_generate_positions.setter)
  let start_line_number = line('.')
  let l:getter = [
        \ '',
        \ 'def ' . l:func . '=(' . l:func . ')',
        \ '@' . l:func . ' = ' . l:func,
        \ 'end',
        \ ]
  call append(line('.'), l:getter)
  let l:len = len(l:getter)
  exec 'normal ' . l:len . '=j'
  call setpos('.', save_pos)
endfunction
