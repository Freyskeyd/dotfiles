" Vim UI {

	if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
		let g:solarized_termcolors=256
		let g:solarized_termtrans=1
		let g:solarized_contrast="normal"
		let g:solarized_visibility="normal"
		color solarized
	endif

	set tabpagemax=15		" Only show 15 tabs
	set showmode			" Display the current mode

	set cursorline 			" Highlight current line
	highlight clear SignColumn	" SignColumn should match background
	highlight clear LineNr		" Current line number row will have same background color in relative mode

	if has('cmdline_info')
		set ruler 		" Show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
		set showcmd
	endif

	if has('statusline')
		set laststatus=2
		
		" Broken down into easily includeable segments
		set statusline=%<%f\ 		" Filename
		set statusline+=%w%h%m%r 	" Options
		set statusline+=%{fugitive#statusline()}	" Git Hotness
		set statusline+=\ [%{&ff}/%Y]
		set statusline+=\ [%{getcwd()}]
		set statusline+=%=%-14.(%l,%c%V%)\ %p%%
	endif
	
	set backspace=indent,eol,start
	set linespace=0			" No extra spaces between rows
	set number			" Line numbers on
	set showmatch			" Show matching brackets/parenthesis
	set incsearch			" Find as you type search
	set hlsearch			" Highlight search terms
	set winminheight=0		" Windows can be 0 line high
	set ignorecase			" Case insensitive search
	set smartcase			" Case sensitive when UC present
	set wildmenu			" Show list instead of just completing
	set wildmode=list:longest,full	" Command <Tab> completion, list matches
	set whichwrap=b,s,h,l,<,>,[,]	" Backspace and cursor keys wrap too
	set scrolljump=5		" Lines to scroll when cursor leaves screen
	set scrolloff=3			" Minimum lines to keep above and below cursor
	set foldenable			" Auto fold code
	set list
	set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

