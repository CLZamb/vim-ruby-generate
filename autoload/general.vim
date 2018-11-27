function! general#get_input()
  let methods = input('method name: ')

  if !exists('methods') || empty(methods)
    throw 'invalid method name'
    return
  endif

  return methods
endfunction
