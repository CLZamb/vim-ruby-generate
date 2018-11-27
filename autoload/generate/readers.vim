echom 'Autoloading...'
function! generate#readers#Reader()
  let save_pos = getpos('.')
  let l:func = general#get_input()

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [['
  let start_line_number = line('.')
  let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  let l:setter = [
        \ 'attr_reader ' . l:temp,
        \ ]
  call append(line('.'), l:setter)
  exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  call setpos('.', save_pos)
endfunction
