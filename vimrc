"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Remap leader to comma
let mapleader = ","

" Copy/paste to clipboard
" "+y
" "+p
if has('macunix')
  set clipboard=unnamed
elseif exists('$WAYLAND_DISPLAY') && executable('wl-copy') && executable('wl-paste')
  " install wl-clipboard
  xnoremap "+y y:call system("wl-copy", @")<cr>
  nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
  nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
elseif has('unix')
  " vim --version | grep clip
  " install vim-gtk
  set clipboard=unnamedplus
end

set mouse=a

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#add('preservim/nerdtree')
  call dein#add('xuyuanp/nerdtree-git-plugin')
  call dein#add('jistr/vim-nerdtree-tabs')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-surround')
  call dein#add('ervandew/supertab')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('wsdjeg/vim-fetch')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('dracula/vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('luochen1990/rainbow')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('editorconfig/editorconfig-vim')

  call dein#add('tpope/vim-markdown')
  call dein#add('slim-template/vim-slim')
  call dein#add('isaacsloan/vim-slang')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('isRuslan/vim-es6')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('posva/vim-vue')
  call dein#add('vim-crystal/vim-crystal')
  call dein#add('peterhoeg/vim-qml')
  call dein#add('mtdl9/vim-log-highlighting')
  call dein#add('dart-lang/dart-vim-plugin')

  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-bundler')

  call dein#add('neomake/neomake')

  call dein#add('vim-scripts/LargeFile')

  call dein#add('wakatime/vim-wakatime')
  call dein#add('tmux-plugins/vim-tmux')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
"
" set cursorcolumn "highlight the current column. Visible in GUI mode only.

let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Fzf search
silent! nmap <C-P> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nmap <Leader>f :Ag<Space><CR>

map <silent> <C-n> :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
\  'separately': {
\    'nerdtree': 0,
\  }
\}

" buffers
map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>

set fileencodings=utf-8,cp1251,cp866,koi8-u
set encoding=utf-8
set termencoding=utf-8

set laststatus=2
set lazyredraw

set t_Co=256
set t_ut=
colorscheme dracula

set shiftwidth=2                         "number of spaces to use in each autoindent step
set tabstop=2                            "two tab spaces
set softtabstop=2                        "number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                            "spaces instead of tabs for better cross-editor compatibility
set smarttab                             "use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                              "recommended seting for automatic C-style indentation
set autoindent                           "automatic indentation in non-C files
set nowrap                               "no wrapping
set copyindent                           "copy the previous indentation on autoindenting
set backspace=indent,eol,start           "allow backspacing over everything in insert mode

set incsearch                            "find the next match as we type the search
set hlsearch                             "hilight searches by default
set ignorecase                           "ignore case when searching

set foldmethod=syntax
set nofoldenable

set noswapfile

set autoread
au CursorHold,CursorHoldI * checktime

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

set number " Show line numbers

" non-blinking cursor
set guicursor=

nmap <Space> <PageDown>

" by default - latin keymap
set iminsert=0
" by default - latin keymap for search
set imsearch=0

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cr'] = ''

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

let g:LargeFile = 5
