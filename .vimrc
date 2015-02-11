"---------------------------------------------------------------
"           General Settings
"---------------------------------------------------------------
set nocompatible                    " choose no compatibility with legacy vi

set encoding=utf-8
set showcmd                         " display incomplete commands
set number

"" Spacing
set nowrap                          " don't wrap lines
set tabstop=2 shiftwidth=2          " a tab is two spaces (or set this to 4)
set expandtab                       " use spaces, not tabs (optional)
set backspace=indent,eol,start      " backspace through everything in insert mode

"" Searching
set hlsearch                            " highlight matches
set incsearch                           " incremental searching
set ignorecase                          " searches are case insensitive...
set smartcase                           " ... unless they contain at least one capital letter
nnoremap <silent> <C-a> :nohl<CR><C-l>  " <Ctrl-l> redraws the screen and removes any search highlighting.

"" Keybindings
let mapleader=","                   " change <leader> to ',' instead of '\'

"" Set Backup folders for annoying temp files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"" Use system clipboard
"set clipboard=unnamedplus

"" Paste the same text multiple times using p
xnoremap p pgvy

"---------------------------------------------------------------
"             Plugins
"---------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim       " Required for Vundle
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Colour Schemes
Plugin 'sickill/vim-monokai'
Plugin 'nanotech/jellybeans.vim'

" Aesthetics
Plugin 'bling/vim-airline'              " A cooler status bar at the bottom
Plugin 'airblade/vim-gitgutter'         " Show git changes in the gutter
Plugin 'kien/rainbow_parentheses.vim'   " Colourful parentheses
Plugin 'kchmck/vim-coffee-script'       " Coffeescript syntax
Plugin 'slim-template/vim-slim'         " Vim slim support
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace
Plugin 'Yggdroot/indentLine'            " Show vertical indent lines

" General
Plugin 'kien/ctrlp.vim'                 " Fuzzy file searching
Plugin 'scrooloose/nerdtree'            " View directory as a sidebar
Plugin 'tpope/vim-surround'             " Easily surround words with tags
Plugin 'wesQ3/vim-windowswap'           " Easy swapping of windows
Plugin 'jistr/vim-nerdtree-tabs'        " Making NERDTree better
Plugin 'rking/ag.vim'                   " Searching text across file directory
Plugin 'scrooloose/syntastic'           " Syntax checking for various languages
Plugin 'Raimondi/delimitMate'           " Auto-complete brackets, parentheseses etc
Plugin 'vim-scripts/vim-auto-save'      " Autosave file changes
Plugin 'Valloric/YouCompleteMe'         " Autocomplete!
Plugin 'tomtom/tcomment_vim'            " Easier commenting

" Ruby/Rails
Plugin 'tpope/vim-endwise'              " Add 'end' after 'if', 'do', 'def' keywords
Plugin 'thoughtbot/vim-rspec'           " Run RSpec tests in Vim
Plugin 'tpope/vim-rails'                " Rails support in Vim

" JavaScript
Plugin 'pangloss/vim-javascript'        " JavaScript highlighting
Plugin 'mxw/vim-jsx'                    " JSX highlighting for Reactjs

call vundle#end()                       " required for Vundle
filetype plugin indent on               " required for Vundle

"---------------------------------------------------------------
"             Display
"---------------------------------------------------------------
set anti enc=utf-8
set guifont=Droid\ Sans\ Mono:h15
colorscheme monokai

"---------------------------------------------------------------
"           Plugin Settings
"---------------------------------------------------------------
syntax enable
filetype plugin indent on               " load file type plugins + indentation

"" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0       " Only search the directory we started Vim in
set wildignore+=*/tmp/*,*.so,*.swp,*.zip      " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe   " Windows

"" NERDTree
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree            " Start NERDTree on Vim startup
autocmd VimEnter * wincmd p            " Set cursor to active buffer
map <leader>r :NERDTreeFind<cr>

"" Airline
let g:airline_theme='luna'

"" Git-Gutter
let g:gitgutter_enabled = 1

"" AutoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

"" vim-better-whitespace
hi ExtraWhitespace ctermbg=red guibg=red
nnoremap <leader>v :StripWhitespace<CR>

"" Rainbow Parentheses - Start on Vim startup
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" indentLine
let g:indentLine_char = '|'

"" ag.vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" use K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

"" Syntastic
" Use MRI and Rubocop checkers for Ruby files
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <leader>z :SyntasticCheck<CR>
nnoremap <leader>c :SyntasticReset<CR>    " Scan file again for syntax erors

"" YouCompleteMe
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"---------------------------------------------------------------
"           Other Key bindings and Settings
"---------------------------------------------------------------
"" Change background for any lines after 80
execute "set colorcolumn=" . join(range(81,335), ',')
" Enable below for jellybeans colour scheme
" hi ColorColumn ctermbg=darkgray guibg=gray15

" Easier window splitting
set splitbelow                         " Sets focus in new bottom window
set splitright                         " Sets focus in new right window

nnoremap <leader>s :vsplit<CR>         " Vertical split on the right side
nnoremap <leader>hs :split<CR>         " Horizontal split on the bottom

map  <C-l> :tabn<CR>                   " Next tab
map  <C-h> :tabp<CR>                   " Previous tab
map  <C-n> :tabnew<CR>                 " New tab

map <C-b> i<Cr><Esc>                   " Move text after cursor to next line

" Retain selection when indenting
vnoremap < <gv
vnoremap > >gv
