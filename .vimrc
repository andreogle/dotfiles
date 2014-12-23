" .vimrc v1.2 - Andre Ogle
" This is my vimrc file. I've tried to build this from the ground up - without copying someone else's vimrc. 
" I will try to keep each setting documented. Feel free to use/copy it. Let me know if you like it.
" Last Updated: 11 December 2014

"---------------------------------------------------------------
"						General Settings
"---------------------------------------------------------------
set nocompatible                		" choose no compatibility with legacy vi
syntax enable		
set encoding=utf-8		
set showcmd                     		" display incomplete commands
filetype plugin indent on       		" load file type plugins + indentation
		
"" Whitespace		
set nowrap                      		" don't wrap lines
set tabstop=2 shiftwidth=2      		" a tab is two spaces (or set this to 4)
set expandtab                   		" use spaces, not tabs (optional)
set backspace=indent,eol,start  		" backspace through everything in insert mode

"" Searching
set hlsearch                    		" highlight matches
set incsearch                   		" incremental searching
set ignorecase                  		" searches are case insensitive...
set smartcase                   		" ... unless they contain at least one capital letter
nnoremap <silent> <C-l> :nohl<CR><C-l>  " <Ctrl-l> redraws the screen and removes any search highlighting.

"" Keybindings
let mapleader=","						" change <leader> to ',' instead of '\'

"---------------------------------------------------------------
"							Plugins
"---------------------------------------------------------------
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
filetype off                  			" required for Vundle
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'			" View directory as a sidebar
Plugin 'sickill/vim-monokai'			" Colour theme for Vim
Plugin 'kien/ctrlp.vim'					" Fuzzy file searching
Plugin 'bling/vim-airline'				" A cooler status bar at the bottom
Plugin 'tpope/vim-endwise'				" Add 'end' after 'if', 'do', 'def' keywords
Plugin 'thoughtbot/vim-rspec'			" Run RSpec tests in Vim
Plugin 'tpope/vim-surround'				" Easily surround words with tags

call vundle#end()            			" required for Vundle
filetype plugin indent on    			" required for Vundle

"---------------------------------------------------------------
"							Display
"---------------------------------------------------------------
set anti enc=utf-8
set guifont=Droid\ Sans\ Mono:h11
colorscheme monokai

"---------------------------------------------------------------
"						Plugin Settings
"---------------------------------------------------------------
" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0				" Only search the directory we started Vim in
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     	" Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  	" Windows

" NERDTree
autocmd VimEnter * NERDTree						" Start NERDTree on Vim startup
autocmd VimEnter * wincmd p						" Set cursor to active buffer

" Airline
let g:airline_theme='luna'

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>	" Run current spec
map <Leader>s :call RunNearestSpec()<CR>		" Run nearest spec
map <Leader>l :call RunLastSpec()<CR>			" Run last spec
map <Leader>a :call RunAllSpecs()<CR>			" Run all specs




