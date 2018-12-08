echom 'Autoloading...'

function! generate#writers#Writer()
  let save_pos = getpos('.')
  try
    let l:func = general#get_input()
  catch
    echo v:exception
    return
  endtry

  :execute 'normal [['
  let start_line_number = line('.')
  let s:comment_escape = '\v^[^#]*'
  " search only inside the class block
  let s:block_openers = '\zs<class>'
  let s:start_pattern = s:comment_escape . s:block_openers
  let s:end_pattern = s:comment_escape . '\zs<end>'
  let s:skip_pattern = 'getline(".") =~ "\\v\\S\\s<(if|unless)>\\s\\S"'
  let s:flags = 'W' " 'W'	don't Wrap around the end of the file
  call searchpair(s:start_pattern, 'attr_writer' ,s:end_pattern, s:flags, s:skip_pattern)
  " end searching
  "
  if empty(matchstr(getline('.'), '\<attr_writer\>'))
    :call general#go_to_position(g:ruby_generatePositions.writer)
    let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
    let l:setter = [
          \ 'attr_writer ' . l:temp,
          \ ]
    call append(line('.'), l:setter)
    " indent currenct line
    exec 'normal =j'
  else

    " search in a range block
    execute 'normal A, :' . l:func . "\<esc>"
  end

  call setpos('.', save_pos)
endfunction
