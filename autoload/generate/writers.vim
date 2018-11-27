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
  let s:block_openers = '\zs<class>'
  let s:start_pattern = s:comment_escape . s:block_openers
  let s:end_pattern = s:comment_escape . '\zs<end>'
  let s:skip_pattern = 'getline(".") =~ "\\v\\S\\s<(if|unless)>\\s\\S"'
  let s:flags = 'W'
  call searchpair(s:start_pattern, 'attr_writer' ,s:end_pattern, s:flags, s:skip_pattern)

  if empty(matchstr(getline('.'), '\<attr_writer\>'))
    :execute 'normal [['
    let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
    let l:setter = [
          \ 'attr_writer ' . l:temp,
          \ ]
    call append(line('.'), l:setter)
    exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  else

    " search in a range block
    execute 'normal A, :' . l:func . '\<Esc>'
  end

  call setpos('.', save_pos)
endfunction
