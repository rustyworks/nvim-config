" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()


function! <SID>CopyCurrentFilePath()
  let @+=@%
endfunction
command! CopyCurrentFilePath call <SID>CopyCurrentFilePath()


function! <SID>ToggleFoldByIndent()
  if (&foldmethod ==# "manual")
    set foldmethod=indent
    set foldnestmax=2
    set foldlevel=1
  elseif (&foldmethod ==# "indent")
    set foldmethod=manual
    set foldnestmax=20
    call feedkeys("zR<cr>")
  end
endfunction
command! ToggleFoldByIndent call <SID>ToggleFoldByIndent()
