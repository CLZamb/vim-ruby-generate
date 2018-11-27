echom 'Autoloading...'
function! generate#variables#PrivateVars()
  let save_pos = getpos('.')
  let l:func = input('method(s) name: ')

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [[][k'
  let start_line_number = line('.')
  let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  let l:setter = [
        \ 'private ' . l:temp,
        \ ]
  call append(line('.'), l:setter)
  exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  call setpos('.', save_pos)
endfunction

function! generate#variables#PublicVars()
  let save_pos = getpos('.')
  let l:func = input('method(s) name: ')

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [[][k'
  let start_line_number = line('.')
  let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  let l:setter = [
        \ 'public ' . l:temp,
        \ ]
  call append(line('.'), l:setter)
  exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  call setpos('.', save_pos)
endfunction

function! generate#variables#ProtectedVars()
  let save_pos = getpos('.')
  let l:func = input('method(s) name: ')

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [[][k'
  let start_line_number = line('.')
  let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  let l:setter = [
        \ 'protected ' . l:temp,
        \ ]
  call append(line('.'), l:setter)
  exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  call setpos('.', save_pos)
endfunction
