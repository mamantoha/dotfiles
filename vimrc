" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" My Bundles here:

" Open new tab only if it doesn't exists,
" otherwise switch to the already open tab
" Create ~/.vim/nerdtree_plugin/override_tab_mapping.vim:
"
" call NERDTreeAddKeyMap({'key': 't', 'callback': 'NERDTreeMyOpenInTab', 'scope': 'FileNode', 'override': 1 })
" function NERDTreeMyOpenInTab(node)
"   call a:node.open({'reuse': "all", 'where': 't'})
" endfunction
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jistr/vim-nerdtree-tabs'

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'

" http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'isRuslan/vim-es6'

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'osyo-manga/vim-monster'
NeoBundle 'Konfekt/FastFold'

NeoBundle 'wakatime/vim-wakatime'

call neobundle#end()

" Required:
filetype plugin indent on
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set cursorline                           "underline the current line in the file
set cursorcolumn                         "highlight the current column. Visible in GUI mode only.

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" open NERDTree on vim startup
map <silent> <C-n> :NERDTreeTabsToggle<CR>


" highlight using Github Flavored Markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

set fileencodings=utf-8,cp1251,cp866,koi8-u
set encoding=utf-8
set termencoding=utf-8

"set statusline=%t\ %y%m%r[%{&fileencoding}][%{&spelllang}][%{&fileformat}]%<[%{strftime(\"%d.%m.%y\",getftime(expand(\"%:p\")))}]%k%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set lazyredraw

set t_Co=256
" colorscheme desert
colorscheme railscasts

" Specify background color
highlight Normal ctermbg=none

" Підтримка мишки
"set mouse=a
"set mousemodel=popup

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

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Execute the :NeoCompleteEnable
" let g:neocomplete#enable_at_startup = 1
" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"

" Use neocomplete.vim
let g:neocomplete#force_omni_input_patterns = {
\   'ruby' : '[^. *\t]\.\|\h\w*::',
\}

set number                               "Show line numbers

" Пробіл в нормальному режимі перелистує сторінки
nmap <Space> <PageDown>

" Ukrainian support | CTRL+^
set keymap=ukrainian-jcuken
" by default - latin keymap
set iminsert=0
" by default - latin keymap for search
set imsearch=0

" F2 - швидке зберігання
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" <F7> File fileformat (dos - <CR> <NL>, Unix - <NL>, mac - <CR>)
map <F7> :execute RotateFileFormat()<CR>
vmap <F7> <C-C><F7>
imap <F7> <C-O><F7>
let b:fformatindex=0

function! RotateFileFormat()
  let y = -1
  while y == -1
    let encstring = "#unix#dos#mac#"
    let x = match(encstring,"#",b:fformatindex)
    let y = match(encstring,"#",x+1)
    let b:fformatindex = x+1
    if y == -1
      let b:fformatindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fileformat=".str
    endif
  endwhile
endfunction

" <F8> File encoding for open
" ucs-2le - MS Windows Unicode encoding
map <F8> :execute RotateEnc()<CR>
vmap <F8> <C-C><F8>
imap <F8> <C-O><F8>
let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Shift+F8> Force file encoding for open (encoding = fileencoding)
map <S-F8> :execute ForceRotateEnc()<CR>
vmap <S-F8> <C-C><S-F8>
imap <S-F8> <C-O><S-F8>
let b:encindex=0
function! ForceRotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      :execute "set encoding=".str
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Ctrl+F8> File encoding for save (convert)
map <C-F8> :execute RotateFEnc()<CR>
vmap <C-F8> <C-C><C-F8>
imap <C-F8> <C-O><C-F8>
let b:fencindex=0
function! RotateFEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:fencindex)
    let y = match(encstring,"#",x+1)
    let b:fencindex = x+1
    if y == -1
      let b:fencindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fenc=".str
    endif
  endwhile
endfunction

" F9 - зміна кодування файлу
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-u :e ++enc=koi8-u<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.ibm-866 :e ++enc=ibm866<CR>
menu Encoding.utf-8 :e ++enc=utf-8 <CR>
map <F9> :emenu Encoding.<TAB>


" ftp://ftp.vim.org/pub/vim/runtime/spell/
if version >= 700
" По замовчуванню перевірка орфографії виключена.
  setlocal spell spelllang=
  setlocal nospell
  function ChangeSpellLang()
    if &spelllang == "en_us"
      setlocal spell spelllang=ru
    elseif &spelllang == "ru"
      setlocal spell spelllang=uk
    elseif &spelllang == "uk"
      setlocal spell spelllang=
      setlocal nospell
    else
      setlocal spell spelllang=en_us
    endif
  endfunc
  " map spell on/off
  map <F11> <Esc>:call ChangeSpellLang()<CR>
endif
