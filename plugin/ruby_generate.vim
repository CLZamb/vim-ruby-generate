" File: ruby_generate.vim
" Author:
" Description:
" Last Modified:
au BufNewFile,BufRead *.rb set filetype=ruby

function! Generate_getter()
  let save_pos = getpos('.')
  " if lastline <
  "   let lastline = line('$')
  "  endif
  let l:func = input('method name: ')

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal ][k'
  let start_line_number = line('.')
  let l:setter = [
        \ '',
        \ 'def ' . l:func,
        \ '@' . l:func,
        \ 'end',
        \ ]
  call append(line('.'), l:setter)
  exec 'normal ' . (start_line_number+2) . 'GV' . len(start_line_number+4) . 'j='
  call setpos('.', save_pos)
endfunction

function! Generate_writer()
  let save_pos = getpos('.')
  let l:func = input('method(s) name: ')

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [['
  let start_line_number = line('.')
  let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  let l:setter = [
        \ 'attr_writer ' . l:temp,
        \ ]
  call append(line('.'), l:setter)
  exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  call setpos('.', save_pos)
endfunction

function! Generate_reader()
  let save_pos = getpos('.')
  let l:func = input('method(s) name: ')

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [['
  let start_line_number = line('.')
  let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  let l:setter = [
        \ 'attr_reader ' . l:temp,
        \ ]
  call append(line('.'), l:setter)
  exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  call setpos('.', save_pos)
endfunction

function! Generate_setter()
  let save_pos = getpos('.')
  let l:func = input('method name: ')

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [[][k'
  let start_line_number = line('.')
  let l:getter = [
        \ '',
        \ 'def ' . l:func . '=(' . l:func . ')',
        \ '@' . l:func . ' = ' . l:func,
        \ 'end',
        \ ]
  call append(line('.'), l:getter)
  exec 'normal ' . (start_line_number+2) . 'GV' . len(start_line_number+4) . 'j='
  call setpos('.', save_pos)
endfunction

function! Generate_accessor()
  let save_pos = getpos('.')
  let l:func = input('method(s) name: ')

  if !exists('l:func') || empty(l:func)
    echo 'invalid method name'
    return
  endif

  :execute 'normal [['
  let start_line_number = line('.')
  let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
  let l:setter = [
        \ 'attr_accessor ' . l:temp,
        \ ]
  call append(line('.'), l:setter)
  exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  call setpos('.', save_pos)
endfunction

function! Generate_private_variables()
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

function! Generate_public_variables()
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

function! Generate_protected_variables()
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

" function! Generate_protected_variables()
"   let getbufline(bufnr('%'), 1, 7)
"   let save_pos = getpos('.')
"   let l:func = input('method(s) name: ')
"
"   if !exists('l:func') || empty(l:func)
"     echo 'invalid method name'
"     return
"   endif
"
"   :execute 'normal [[][k'
"   let start_line_number = line('.')
"   let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
"   let l:setter = [
"         \ 'protected ' . l:temp,
"         \ ]
"   call append(line('.'), l:setter)
"   exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
"   call setpos('.', save_pos)
" endfunction

command! GenerateGetter       :call Generate_getter()
command! GenerateSetter       :call Generate_setter()
command! GenerateReader       :call Generate_reader()
command! GenerateWriter       :call Generate_writer()
command! GenerateAccessor     :call Generate_accessor()
command! GeneratePrivateVar   :call Generate_private_variables()
command! GenerateProtectedVar :call Generate_protected_variables()
command! GeneratePublicVar    :call Generate_public_variables()

nnoremap <leader>ga :GenerateAccessor<cr>
nnoremap <leader>gg :GenerateGetter<cr>
nnoremap <leader>gr :GenerateReader<cr>
nnoremap <leader>gs :GenerateSetter<cr>
nnoremap <leader>gw :GenerateWriter<cr>
nnoremap <leader>gb :GeneratePublicVar<cr>
nnoremap <leader>gv :GeneratePrivateVar<cr>
nnoremap <leader>gt :GenerateProtectedVar<cr>
