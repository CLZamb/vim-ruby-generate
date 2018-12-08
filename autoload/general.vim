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
 let g:ruby_generatePositions = {
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
