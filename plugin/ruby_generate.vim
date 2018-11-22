" File: ruby_generate.vim
" Author: Cristian Zambrano
" Description:
" Last Modified:
au BufNewFile,BufRead *.rb set filetype=ruby

function! s:ruby_determine_variables()
endfunction

function! Get_input()
  let methods = input('method name: ')

  if !exists('methods') || empty(methods)
    throw 'invalid method name'
    return
  endif

  return methods
endfunction

function! Generate_writer()
  let save_pos = getpos('.')

  try
    let l:func = Get_input()
  catch
    echo v:exception
    return
  endtry

  :execute 'normal [['
  let s:comment_escape = '\v^[^#]*'
  let s:block_openers = '\zs<class>'
  let s:start_pattern = s:comment_escape . s:block_openers
  let s:end_pattern = s:comment_escape . '\zs<end>'
  let s:skip_pattern = 'getline(".") =~ "\\v\\S\\s<(if|unless)>\\s\\S"'
  let s:flags = 'W'
  call searchpair(s:start_pattern, 'attr_writer' ,s:end_pattern, s:flags, s:skip_pattern)

  if empty(matchstr(getline('.'), '\<attr_writer\>'))
    " search in a range block
 		execute 'normal A ' . l:func . '\<Esc>'
		return
	else
		let l:temp = substitute(l:func, '\(\w\+\)', ':\1', 'g')
		let l:setter = [
					\ 'attr_writer ' . l:temp,
					\ ]
		call append(line('.'), l:setter)
		exec 'normal ' . (start_line_number) . 'GV' . len(start_line_number+1) . 'j='
  end

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
  " Move backwards to the method definiton if you are not already on the
  " correct line
  if empty(matchstr(getline("."), '\< attr_accessor\>'))
    exec "?\\<attr_accessor\\>"
  endif

  execute "normal A(" . name . ")\<Esc>"

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
