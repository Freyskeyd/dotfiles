" General {
    set background=dark
    filetype plugin indent on
    syntax on
    set mouse=a
    set mousehide
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')
            set clipboard=unnamed,unnamedplus
        else
            set clipboard=unnamed
        endif
    endif

    set shortmess+=filmnrxoOtT                          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash     " Better Unix Compatibility
    set virtualedit=onemore                             " Allow for cursor beyond last character
    set history=1000                                    " Store a ton of history (default is 20)
    set spell                                           " Spell checking on
    set hidden                                          " Allow buffer switching without saving
    set iskeyword-=.                                    " '.' is an end of word designator
    set iskeyword-=#                                    " '#' is an end of word designator
    set iskeyword-=-                                    " '-' is an end of word designator

    " Instead of reverting the cursor to the last position in the buffer,
    " we set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, Ø])

    " Restore cursor position in previous editing session
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    " Setting up the directories {
    set backup
    if has('persistent_undo')
        set undofile        " So is persistent undo...
        set undolevels=1000 " Maximum number of changs that can be undone
        set undoreload=1000 " Maximum number of lines to save for undo on a buffer reload
    endif
    " }

    if exists('$TMUX')
        set ttymouse=xterm2
    endif
" }
