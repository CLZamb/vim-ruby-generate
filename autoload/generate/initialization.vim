echom 'Autoloading_getter...'
function! generate#initialization#Initialization()
  l:string = 'indentation variables'
  let save_pos = getpos('.')
  try
    let l:funcs = general#get_input('variables')
  catch
    echo v:exception
    return
  endtry

  call general#go_to_position(g:ruby_generate_positions.getter)
  let start_line_number = line('.')
  let l:getter = [
        \ '',
        \ 'def initialization(' . l:funcs .')',
        \ 'end',
        \ ]
  call append(line('.'), l:getter)
  let l:len = len(l:getter)
  exec 'normal ' . l:len . '=j'
  call setpos('.', save_pos)
endfunction
