echom 'Autoloading...'
function! generate#accessors#Accessor()
  " Move backwards to the method definiton if you are not already on the

  let save_pos = getpos('.')
  try
    let l:funcs = general#get_input('method(s) name(s): ')
  catch
    echo v:exception
    return
  endtry


  let l:accessor = 'attr_accessor'
  call general#search_in_block(l:accessor)
  call general#append_code(l:accessor, l:funcs, g:ruby_generate_positions.accessor)
  call setpos('.', save_pos)
endfunction
