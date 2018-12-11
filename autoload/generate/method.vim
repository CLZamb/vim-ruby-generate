echom 'Autoloading...'

function! generate#method#Method()
  let save_pos = getpos('.')
  try
    let l:funcs = general#get_input()
  catch
    echo v:exception
    return
  endtry

  call general#go_to_position(g:ruby_generate_positions.getter)
  let start_line_number = line('.')
  let l:getter = [
        \ '',
        \ 'def ' . l:funcs,
        \ 'end',
        \ ]
  call append(line('.'), l:getter)
  let l:len = len(l:getter)
  exec 'normal ' . l:len . '=j'
  exec "normal 2jo\<Space>\<BS>\<Esc>"
  startinsert!
  "call setpos('.', save_pos)
endfunction
