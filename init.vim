if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"---------------------------------------------------------------
"           General Settings
"---------------------------------------------------------------
set nocompatible                    " choose no compatibility with legacy vi
set shell=/bin/bash

set encoding=utf-8
set showcmd                               " display incomplete commands
set relativenumber
set cursorline                            " Highlight row
set cursorcolumn                          " Highlight column

"" Python Support
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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
nnoremap <silent> <C-x> :nohl<CR><C-l>  " <Ctrl-x> redraws the screen and removes any search highlighting.

"" Keybindings
let mapleader=","                        " change <leader> to ',' instead of '\'

"" No swap files
set noswapfile

"" Store undo history
set undofile

"" Use system clipboard
set clipboard=unnamed

"" Mouse
set mouse=a

"" Paste the same text multiple times using p
xnoremap p pgvy

filetype plugin on

"---------------------------------------------------------------
"             Plugins
"---------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Colour Schemes
Plug 'NLKNguyen/papercolor-theme'

" Aesthetics
Plug 'vim-airline/vim-airline'        " A cooler status bar at the bottom
Plug 'vim-airline/vim-airline-themes' " A cooler status bar at the bottom
Plug 'airblade/vim-gitgutter'         " Show git changes in the gutter
Plug 'kien/rainbow_parentheses.vim'   " Colourful parentheses
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace
Plug 'valloric/MatchTagAlways'        " Highlight matching tags
Plug 'sheerun/vim-polyglot'           " Language support
Plug 'ap/vim-css-color'               " Highlight CSS colors

" General
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'                          " Fuzzy file searching
Plug 'scrooloose/nerdtree'                       " View directory as a sidebar
Plug 'tpope/vim-surround'                        " Easily surround words with tags
Plug 'wesQ3/vim-windowswap'                      " Easy swapping of windows
Plug 'jistr/vim-nerdtree-tabs'                   " Making NERDTree better
Plug 'rking/ag.vim'                              " Searching text across file directory
Plug 'Raimondi/delimitMate'                      " Auto-complete brackets, parentheseses etc
Plug 'vim-scripts/vim-auto-save'                 " Autosave file changes
Plug 'tomtom/tcomment_vim'                       " Easier commenting
Plug 'tpope/vim-fugitive'                        " Git integration
Plug 'int3/vim-extradite'                        " Browse and diff git commits
Plug 'neovim/node-host', { 'do': 'npm install' } " Needed for mdown.vim
Plug 'vimlab/mdown.vim', { 'do': 'npm install' } " Live MarkDown previews
Plug 'leshill/vim-json'                          " Better JSON support

" Ruby/Rails
Plug 'tpope/vim-endwise'              " Add 'end' after 'if', 'do', 'def' keywords
Plug 'ck3g/vim-change-hash-syntax'    " Convert old hash syntax to new syntax

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

call plug#end()

syntax enable

"---------------------------------------------------------------
"             Display
"---------------------------------------------------------------
set enc=utf-8

"set guifont=Droid\ Sans\ Mono:h15
set background=dark
colorscheme PaperColor

"---------------------------------------------------------------
"                      NeoVim Specific
"---------------------------------------------------------------

if has('nvim')
  " Any NeoVim specific settings
end

"---------------------------------------------------------------
"           Plugin Settings
"---------------------------------------------------------------
"" fzf
set rtp+=/usr/local/opt/fzf
map  <C-p> :Files<CR>

"" NERDTree
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree            " Start NERDTree on Vim startup
autocmd VimEnter * wincmd p            " Set cursor to active buffer
map <leader>r :NERDTreeFind<cr>

"" Airline
let g:airline_theme='simple'

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

"" ripgrep
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" Use ':F <searchteam>' to search for instances of a word
command! -bang -nargs=* F call fzf#vim#grep('
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow
  \ --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" use K to grep word under cursor
set grepprg=rg\ --vimgrep
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" scroll through searches with left/right
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

"" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " Use tab to scroll through suggestions

"" mdown.vim
nnoremap <leader>ip :Mpreview<CR>      " View markdown preview in browser

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

autocmd InsertEnter * :set number         " Set absolute numbering while in insert mode
autocmd InsertLeave * :set relativenumber " Set relative numbering while out of insert mode

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

