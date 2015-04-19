" Formatting {
	set nowrap		" Do not wrap long lines
	set autoindent		" Indent at the same level of the previous line
	set shiftwidth=4
	set expandtab
	set tabstop=4
	set softtabstop=4
	set nojoinspaces
	set splitright
	set splitbelow
	set pastetoggle=<F12>

	autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()

	autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
	autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2

	" Workaround vim-commentary for Haskell
	autocmd FileType haskell setlocal commentstring=--\ %s
	" Workaround broken color highlighting in Haskell
	autocmd FileType haskell,rust setlocal nospell
" }
