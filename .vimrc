"---------------------------------------------------------------
"           General Settings
"---------------------------------------------------------------
set nocompatible                    " choose no compatibility with legacy vi
set shell=/bin/bash

set encoding=utf-8
set showcmd                         " display incomplete commands
set number

"" Spacing
set nowrap                          " don't wrap lines
set tabstop=2 shiftwidth=2          " a tab is two spaces (or set this to 4)
set shiftround
set expandtab                       " use spaces, not tabs (optional)
set backspace=indent,eol,start      " backspace through everything in insert mode

"" Searching
set hlsearch                            " highlight matches
set incsearch                           " incremental searching
set ignorecase                          " searches are case insensitive...
set smartcase                           " ... unless they contain at least one capital letter
nnoremap <silent> <C-a> :nohl<CR><C-l>  " <Ctrl-a> redraws the screen and removes any search highlighting.

"" Keybindings
let mapleader=","                   " change <leader> to ',' instead of '\'

"" No swap files
set noswapfile

"" Store undo history
set undofile

"" Use system clipboard
set clipboard=unnamedplus

"" Paste the same text multiple times using p
xnoremap p pgvy

"---------------------------------------------------------------
"             Plugins
"---------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim       " Required for Vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Colour Schemes
Plugin 'sickill/vim-monokai'
Plugin 'nanotech/jellybeans.vim'

" Aesthetics
Plugin 'bling/vim-airline'              " A cooler status bar at the bottom
Plugin 'airblade/vim-gitgutter'         " Show git changes in the gutter
Plugin 'kien/rainbow_parentheses.vim'   " Colourful parentheses
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace
"Plugin 'Yggdroot/indentLine'           " Show vertical indent lines
Plugin 'valloric/MatchTagAlways'        " Highlight matching tags
Plugin 'sheerun/vim-polyglot'           " Language support

" General
Plugin 'ctrlpvim/ctrlp.vim'             " Fuzzy file searching
Plugin 'scrooloose/nerdtree'            " View directory as a sidebar
Plugin 'tpope/vim-surround'             " Easily surround words with tags
Plugin 'wesQ3/vim-windowswap'           " Easy swapping of windows
Plugin 'jistr/vim-nerdtree-tabs'        " Making NERDTree better
Plugin 'rking/ag.vim'                   " Searching text across file directory
Plugin 'Raimondi/delimitMate'           " Auto-complete brackets, parentheseses etc
Plugin 'vim-scripts/vim-auto-save'      " Autosave file changes
Plugin 'Valloric/YouCompleteMe'         " Autocomplete!
Plugin 'tomtom/tcomment_vim'            " Easier commenting
Plugin 'tpope/vim-fugitive'             " Git integration
Plugin 'int3/vim-extradite'             " Browse and diff git commits
Plugin 'scrooloose/syntastic'           " Syntax checking for various languages
Plugin 'suan/vim-instant-markdown'      " Instant markdown in the browser
"Plugin 'kshenoy/vim-signature'          " Bookmarks
Plugin 'leshill/vim-json'               " Better JSON support

" Ruby/Rails
Plugin 'tpope/vim-endwise'              " Add 'end' after 'if', 'do', 'def' keywords
Plugin 'thoughtbot/vim-rspec'           " Run RSpec tests in Vim
Plugin 'tpope/vim-rails'                " Rails support in Vim
Plugin 'ck3g/vim-change-hash-syntax'    " Convert old hash syntax to new syntax

call vundle#end()                       " required for Vundle
filetype plugin indent on               " required for Vundle

"---------------------------------------------------------------
"             Display
"---------------------------------------------------------------
set enc=utf-8
set guifont=Droid\ Sans\ Mono:h15
colorscheme monokai

"---------------------------------------------------------------
"           Plugin Settings
"---------------------------------------------------------------
syntax enable

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

"" vim-fugitive
set diffopt+=vertical                  " Veritcal splits for :Gdiff
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>

"" AutoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

"" vim-better-whitespace
hi ExtraWhitespace ctermbg=red guibg=red
nnoremap <leader>v :StripWhitespace<CR>

"" Rainbow Parentheses - Start on Vim startup
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" vim-extradite
let g:extradite_width = 175

"" indentLine
"let g:indentLine_char = '|'

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
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["ruby", "javascript"] }

nnoremap <leader>z :SyntasticCheck<CR>
nnoremap <leader>c :SyntasticReset<CR>    " Scan file again for syntax erors

"" YouCompleteMe
let g:ycm_add_preview_to_completeopt=0
let g:ycm_register_as_syntastic_checker = 0
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

" Tab label - file names only
set tabline=%!MyTabLine()
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label =  bufname(buflist[winnr - 1])
  return fnamemodify(label, ":t")
endfunction

"---------------------------------------------------------------
"                      NeoVim Specific
"---------------------------------------------------------------
if has('nvim')
  " Neovim terminal
  nnoremap <leader>e :term<CR>
  " This maps Leader + e to exit terminal mode.
  tnoremap <leader>e <C-\><C-n><CR>
end
