echom 'Autoloading...'
function! generate#variables#PrivateVars()
  let save_pos = getpos('.')
  try
    let l:funcs = general#get_input()
  catch
    echo v:exception
    return
  endtry

  let l:private = 'private'
call general#search_in_block(l:private)
call general#append_code(l:private, l:funcs, g:ruby_generate_positions.privateVars)
call setpos('.', save_pos)
endfunction

function! generate#variables#PublicVars()
  let save_pos = getpos('.')
  try
    let l:funcs = general#get_input()
  catch
    echo v:exception
    return
  endtry

  let l:private = 'public'
  call general#search_in_block(l:private)
  call general#append_code(l:private, l:funcs, g:ruby_generate_positions.publicVars)
  call setpos('.', save_pos)
endfunction

function! generate#variables#ProtectedVars()
  let save_pos = getpos('.')
  try
    let l:funcs = general#get_input()
  catch
    echo v:exception
    return
  endtry

  let l:protected = 'protected'
  call general#search_in_block(l:protected)
  call general#append_code(l:protected, l:funcs, g:ruby_generate_positions.protectedVars)

  " :call general#go_to_position(g:ruby_generatePositions.protectedVars)
  " let start_line_number = line('.')
  " let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  " let l:setter = [
  "       \ 'protected ' . l:temp,
  "       \ ]
  " call append(line('.'), l:setter)
  " exec 'normal =j'
  call setpos('.', save_pos)
endfunction
