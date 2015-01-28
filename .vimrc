" Andre Ogle
" This is my vimrc file. I've tried to build this from the ground up - without copying someone else's vimrc.
" I will try to keep each setting documented. Feel free to use/copy it. Let me know if you like it.
" Last Updated: 12 January 2014

"---------------------------------------------------------------
"           General Settings
"---------------------------------------------------------------
set nocompatible                    " choose no compatibility with legacy vi

set encoding=utf-8
set showcmd                         " display incomplete commands
set number

"" Whitespace
set nowrap                          " don't wrap lines
set tabstop=2 shiftwidth=2          " a tab is two spaces (or set this to 4)
set expandtab                       " use spaces, not tabs (optional)
set backspace=indent,eol,start      " backspace through everything in insert mode

"" Change background for any lines after 80
execute "set colorcolumn=" . join(range(81,335), ',')

"" Searching
set hlsearch                        " highlight matches
set incsearch                       " incremental searching
set ignorecase                      " searches are case insensitive...
set smartcase                       " ... unless they contain at least one capital letter
nnoremap <silent> <C-l> :nohl<CR><C-l>  " <Ctrl-l> redraws the screen and removes any search highlighting.

"" Keybindings
let mapleader=","                   " change <leader> to ',' instead of '\'

" Set Backup folders for annoying temp files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Strip all whitespace on save
autocmd BufWrite * :%s/\s\+$//e

"---------------------------------------------------------------
"             Plugins
"---------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim       " Required for Vundle
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Aesthetics
Plugin 'sickill/vim-monokai'            " Colour theme for Vim
Plugin 'bling/vim-airline'              " A cooler status bar at the bottom
Plugin 'airblade/vim-gitgutter'         " Show git changes in the gutter
Plugin 'mxw/vim-jsx'                    " JSX highlighting for Reactjs
Plugin 'kien/rainbow_parentheses.vim'   " Colourful parentheses
Plugin 'kchmck/vim-coffee-script'       " Coffeescript syntax
Plugin 'slim-template/vim-slim'
"Plugin 'Yggdroot/indentLine'            " Show vertical lines

" General
Plugin 'kien/ctrlp.vim'                 " Fuzzy file searching
Plugin 'scrooloose/nerdtree'            " View directory as a sidebar
Plugin 'tpope/vim-surround'             " Easily surround words with tags
Plugin 'vim-scripts/vim-auto-save'      " Autosave file changes
Plugin 'wesQ3/vim-windowswap'           " Easy swapping of windows
Plugin 'jistr/vim-nerdtree-tabs'        " Making NERDTree better
Plugin 'rking/ag.vim'                   " Searching text across file directory
Plugin 'scrooloose/syntastic'           " Syntax checking for various languages

" Ruby/Rails
Plugin 'tpope/vim-endwise'              " Add 'end' after 'if', 'do', 'def' keywords
Plugin 'thoughtbot/vim-rspec'           " Run RSpec tests in Vim
Plugin 'tpope/vim-rails'                " Rails support in Vim!

call vundle#end()                       " required for Vundle
filetype plugin indent on               " required for Vundle

"---------------------------------------------------------------
"             Display
"---------------------------------------------------------------
set anti enc=utf-8
set guifont=Droid\ Sans\ Mono:h13
colorscheme monokai

"---------------------------------------------------------------
"           Plugin Settings
"---------------------------------------------------------------
syntax enable
filetype plugin indent on               " load file type plugins + indentation

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0       " Only search the directory we started Vim in
set wildignore+=*/tmp/*,*.so,*.swp,*.zip      " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe   " Windows

" NERDTree
autocmd VimEnter * NERDTree            " Start NERDTree on Vim startup
autocmd VimEnter * wincmd p            " Set cursor to active buffer
map <leader>r :NERDTreeFind<cr>

" Airline
let g:airline_theme='luna'

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>  " Run current spec
map <Leader>s :call RunNearestSpec()<CR>      " Run nearest spec
map <Leader>l :call RunLastSpec()<CR>         " Run last spec
map <Leader>a :call RunAllSpecs()<CR>         " Run all specs

" Git-Gutter
let g:gitgutter_enabled = 1

" AutoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" Rainbow Parentheses - Start on Vim startup
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

" indentLine
"let g:indentLine_char = '︙'

" ag.vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

"---------------------------------------------------------------
"           Key bindings
"---------------------------------------------------------------
" Easier window splitting
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>hs :split<CR>
