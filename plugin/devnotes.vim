" devnotes.vim - Quick development notes
" Maintainer:    Luca Guidi <http://lucaguidi.com>
" Version:       0.1

if exists('g:loaded_devnotes') || &cp
  finish
endif
let g:loaded_devnotes = 1

if !exists('g:devnotes_directory')
  let g:devnotes_directory = expand("%:p:h")
endif

if !exists('g:devnotes_file')
  let g:devnotes_file = '.devnotes'
endif

" Private functions {{{1
function! devnotes#file()
  return g:devnotes_directory . '/' . g:devnotes_file
endfunction

function! devnotes#count()
  return system("wc -l " . devnotes#file() . " | awk '{printf $1}'")
endfunction

function! devnotes#statusline()
  if !filereadable(devnotes#file())
    return ''
  endif

  return '[ ' . devnotes#count() . ' note(s) ]'
endfunction
" }}}1

" Public functions {{{1
function! DevNotes()
  :execute "sp ". devnotes#file()
endfunction
" }}}1

" Mappings {{{1
map <Leader>dn :call DevNotes()<CR>
" }}}1
