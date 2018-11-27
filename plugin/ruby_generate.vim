" File: ruby_generate.vim
" Author: Cristian Zambrano
" Description: generate common code parameters/functions
" Last Modified: November 27 2018

if exists('g:loaded_ruby_generate')
  finish
endif

let g:loaded_ruby_generate = 1

command! GenerateGetter       :call generate#getter#Getter()
command! GenerateSetter       :call generate#setter#Setter()
command! GenerateReader       :call generate#readers#Reader()
command! GenerateWriter       :call generate#writers#Writer()
command! GenerateAccessor     :call generate#accessors#Accessor()
command! GeneratePrivateVar   :call generate#variables#PrivateVars()
command! GenerateProtectedVar :call generate#variables#PublicVars()
command! GeneratePublicVar    :call generate#variables#ProtectedVars()

nnoremap <leader>ga :GenerateAccessor<cr>
nnoremap <leader>gg :GenerateGetter<cr>
nnoremap <leader>gr :GenerateReader<cr>
nnoremap <leader>gs :GenerateSetter<cr>
nnoremap <leader>gw :GenerateWriter<cr>
nnoremap <leader>gb :GeneratePublicVar<cr>
nnoremap <leader>gv :GeneratePrivateVar<cr>
nnoremap <leader>gt :GenerateProtectedVar<cr>
