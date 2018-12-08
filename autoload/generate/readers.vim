echom 'Autoloading...'
function! generate#readers#Reader()
  let save_pos = getpos('.')
  try
    let l:func = general#get_input()
  catch
    echo v:exception
    return
  endtry

  :call general#go_to_position(g:ruby_generatePositions.reader)
  let start_line_number = line('.')
  let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  let l:setter = [
        \ 'attr_reader ' . l:temp,
        \ ]
  call append(line('.'), l:setter)
  exec 'normal =j'
  call setpos('.', save_pos)
endfunction
