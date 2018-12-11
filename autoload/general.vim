function! general#get_input()
  let methods = input('method name: ')

  if !exists('methods') || empty(methods)
    throw 'invalid method name'
    return
  endif

  return methods
endfunction

" Set up some common global/buffer variables.
function! general#RubyGenerateSetUpVariables()
  " Path to coffee executable
 let g:ruby_generate_positions = {
        \ 'getter':        'bottom',
        \ 'setter':        'bottom',
        \ 'writer':        'top',
        \ 'reader':        'top',
        \ 'accessor':      'top',
        \ 'publicVars':    'bottom',
        \ 'privateVars':   'bottom',
        \ 'protectedVars': 'bottom',
        \ }
endfunction

function! general#go_to_position(position)
 if a:position ==? 'top'
   :execute 'normal [['
 elseif a:position ==? 'bottom'
   :execute 'normal [[][k'
 endif
endfunction

function! general#search_in_block(target)
  :execute 'normal [['
  let s:comment_escape = '\v^[^#]*'
  " search only inside the class block
  let s:block_openers = '\zs(<def>|<if>|<do>|<module>|<class>)'
  let s:start_pattern = s:comment_escape . s:block_openers
  let s:end_pattern = s:comment_escape . '\zs<end>'
  let s:skip_pattern = 'getline(".") =~ "\\v\\S\\s<(if|unless)>\\s\\S"'
  let s:flags = 'W' " 'W'	don't Wrap around the end of the file
  call searchpair(s:start_pattern, a:target ,s:end_pattern, s:flags, s:skip_pattern)
  " end searching
endfunction


function! general#append_code(accessor_or_access_control, methods_or_vars, position)
  " if the current line doesn't have an accessor or access control add at position
  " append at position such as 'writter :method_name' at bottom of a class
  " else then append the the new variable(s)
  if empty(matchstr(getline('.'), '\<'. a:accessor_or_access_control .'\>'))
    call general#go_to_position(a:position)
    " coverting the string to the symbol
    let l:func_to_sym = substitute(a:methods_or_vars, '\(\w\+\)', ':\1', 'g')
    let l:setter = [
          \ a:accessor_or_access_control . ' ' . l:func_to_sym,
          \ ]
    call append(line('.'), l:setter)
    " indent currenct line
    exec 'normal =j'
  else

    " append at the end of the line
    execute 'normal A, :' . a:methods_or_vars . "\<esc>"
  end
endfunction
