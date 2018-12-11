echom 'Autoloading...'

function! generate#writers#Writer()
  let save_pos = getpos('.')
  try
    let l:funcs = general#get_input('method(s) names(s): ')
  catch
    echo v:exception
    return
  endtry

  let l:writer = 'attr_writer'
  call general#search_in_block(l:writer)
  call general#append_code(l:writer, l:funcs, g:ruby_generate_positions.writer)
  call setpos('.', save_pos)
endfunction
