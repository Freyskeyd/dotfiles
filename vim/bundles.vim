filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

runtime git.vundle
runtime languages.vundle
runtime appearance.vundle
runtime textobjects.vundle
runtime search.vundle
runtime project.vundle
runtime vim-improvements.vundle

if filereadable(expand("~/.dotfiles/vim/.bundles.local"))
	source ~/.dotfiles/vim/.bundles.local
endif

call vundle#end()

filetype plugin indent on
