filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/
set rtp+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

runtime deps.vundle
runtime html.vundle
runtime python.vundle
runtime general.vundle
runtime javascript.vundle
runtime ruby.vundle
runtime general_programming.vundle
runtime misc.vundle
runtime scala.vundle
runtime git.vundle
runtime php.vundle
runtime search.vundle
runtime project.vundle
runtime snip_autocomplete.vundle

if filereadable(expand("~/.dotfiles/vim/.bundles.local"))
	source ~/.dotfiles/vim/.bundles.local
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
