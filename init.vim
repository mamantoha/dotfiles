"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/bundles')
  call dein#begin('~/.config/nvim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('jistr/vim-nerdtree-tabs')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-endwise')
  call dein#add('ervandew/supertab')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('jpo/vim-railscasts-theme')

  call dein#add('tpope/vim-markdown')
  call dein#add('slim-template/vim-slim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('isRuslan/vim-es6')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('posva/vim-vue')
  call dein#add('rhysd/vim-crystal')

  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-bundler')

  call dein#add('neomake/neomake')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/deoplete-rct')
  call dein#add('fishbullet/deoplete-ruby')
  call dein#add('yoru/deoplete-crystal')

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
"set cursorline                           "underline the current line in the file
set cursorcolumn                         "highlight the current column. Visible in GUI mode only.

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'
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

" open NERDTree on vim startup
map <silent> <C-n> :NERDTreeTabsToggle<CR>

set fileencodings=utf-8,cp1251,cp866,koi8-u
set encoding=utf-8
set termencoding=utf-8

set laststatus=2
set lazyredraw

set termguicolors

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme railscasts

" Specify background color
highlight Normal ctermbg=none

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

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Remap leader to comma
let mapleader = ","

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
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

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" https://github.com/yoru/deoplete-crystal
let g:deoplete#sources#crystal#bin = '/usr/local/bin/cracker'
let g:deoplete#sources#crystal#lib = '/usr/share/crystal'

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
