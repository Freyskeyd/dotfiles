" Misc {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        let g:NERDShutUp=1
    endif

    if isdirectory(expand("~/.vim/bundle/matchit.zip"))
        let b:match_ignorecase=1
    endif
" }

" Tell showmarks to not include the various brace marks (),{}, etc
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"

let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
