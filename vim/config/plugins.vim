" Misc {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        let g:NERDShutUp=1
    endif

    if isdirectory(expand("~/.vim/bundle/matchit.zip"))
        let b:match_ignorecase=1
    endif
" }

let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
