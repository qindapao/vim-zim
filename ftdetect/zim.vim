function! Ftdetect_zim()
  " No change if we didn't start with a txt file
  if &ft != 'text'
    return
  endif
  if getline(1) =~ "Content-Type: text/x-zim-wiki"
    set ft=zim
    " 先关闭所有感染的语法高亮，然后打开zim自己的
    syntax off
    syntax on
  endif
endfunction


augroup Zim
au BufNewFile,BufRead *.txt call Ftdetect_zim()
augroup END
