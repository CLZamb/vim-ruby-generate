echom 'Autoloading...'
function! generate#readers#Reader()
  let save_pos = getpos('.')
  try
    let l:funcs = general#get_input('method(s) names(s): ')
  catch
    echo v:exception
    return
  endtry

  :execute 'normal [['
  let l:reader = 'attr_reader'
  call general#search_in_block(l:reader)
  call general#append_code(l:reader, l:funcs, g:ruby_generate_positions.reader)
  call setpos('.', save_pos)
endfunction
