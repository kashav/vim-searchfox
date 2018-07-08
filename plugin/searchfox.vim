" searchfox.vim - Use Searchfox directly from Vim
" Maintainer:   Kashav Madan <https://kshvmdn.com>
" Version:      0.1
"
" License:
" Copyright (c) 2018 Kashav Madan.
"
" Usage:
" https://github.com/kshvmdn/vim-searchfox/blob/master/README.md

if !exists("g:searchfox_url")
  let g:searchfox_url = "https://searchfox.org/mozilla-central/"
endif

function! s:openurl(url)
  call netrw#BrowseX(a:url, netrw#CheckIfRemote())
endfunction

function! s:searchfox_open()
  call s:openurl(join([g:searchfox_url, "source/", expand('%'), "#", line('.')], ""))
endfunction

function! s:searchfox_search()
  " TODO: Add support for passing search query via function args (i.e., for
  " non-selection searches).
  let sel = getpos('.') == getpos("'<") ? getline("'<")[getpos("'<")[2] - 1:getpos("'>")[2] - 1] : ''
  let words = [empty(sel) ? expand("<cword>") : sel]

  let query = join(words, " ")
  let query = substitute(query, '^\s*\(.\{-}\)\s*$', '\1', '')
  let query = substitute(query, '"', '\\"', 'g')
  let query = escape(query, "#?&;|%")

  call s:openurl(join([g:searchfox_url, "search?q=", query], ""))
endfunction

execute "command! SFOpen :call s:searchfox_open()"
execute "command! -nargs=* -range SFSearch :call s:searchfox_search()"
