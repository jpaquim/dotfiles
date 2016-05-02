" Install plug, for plugin management
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin()
Plug 'flazz/vim-colorschemes'          " colorschemes
Plug 'scrooloose/nerdtree'             " file browser
Plug 'tpope/vim-fugitive'              " git
Plug 'scrooloose/syntastic'            " syntax
Plug 'tpope/vim-surround'              " (), [], {}
Plug 'ctrlpvim/ctrlp.vim'              " fuzzy find
Plug 'vim-airline/vim-airline'         " pretty status bar
Plug 'vim-airline/vim-airline-themes'  " themes for airline
Plug 'scrooloose/nerdcommenter'        " comments
Plug 'ervandew/supertab'
" Plug 'airblade/vim-gitgutter'          "
" Plug 'majutsushi/tagbar'               "
call plug#end()

" Appearance
set background=dark
colorscheme solarized
set number     " show line numbers
set cursorline " highlight current line
set ruler      " shows line position
set showcmd    " shows current command
set lazyredraw " redraw only when needed
let &colorcolumn=join(range(81,500),",") " highlight columns after 80
set wrap linebreak nolist " soft wrap

" Tabs
set expandtab     " replace tab with spaces
set tabstop=4     " number of visual spaces per TAB
set shiftwidth=4  " number of spaces in indentation
set softtabstop=4 " number of spaces in tab when editing

" Splits
set splitbelow " new window goes below
set splitright " new window goes to the right

" Keyboard Mappings
set timeoutlen=500 " timeout for key combinations
" jk in sucession to return to normal mode
inoremap jk <Esc>
cnoremap jk <Esc>
" vnoremap jk <Esc>
" leader from \ to the space bar
map <Space> <Leader>
map <Space><Space> <Leader><Leader>
" leader+w to save
nnoremap <Leader>w :w<CR>
" leader+x to save and quit
nnoremap <Leader>x :x<CR>
" leader+q to quit
nnoremap <Leader>q :q<CR>

" switch window with <C-direction>
nnoremap <BS> <C-w>h
" nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" window controls in terminal mode
tnoremap <C-w> <C-\><C-n><C-w>

" toggle NERDTree with <C-N>
map <C-N> :NERDTreeToggle<CR>
" clear search highlighting with //
nnoremap // :noh<CR><Esc>
" auto-close C-style bracket scopes
inoremap {<CR> {<CR>}<Esc>ko

" Plugins
let NERDSpaceDelims=1 " insert a space after comment delimiter
let g:airline_powerline_fonts = 1 " enable powerline special characters

" Misc
" return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Defaults for nvim
"!filetype plugin indent on
"!syntax enable
"!set langnoremap
"!set autoindent
"!set backspace=indent,eol,start
"!set complete-=i
"!set smarttab
"!set nrformats-=octal
"!set incsearch
"!set hlsearch
"!set mouse=a
"!set laststatus=2
"!set wildmenu
"!set display+=lastline
"!set listchars=tab:>\ ,trail:-,nbsp:+
"!set formatoptions+=j
"!setglobal tags-=./tags tags^=./tags;
"!set autoread
"!set history=10000
"!set tabpagemax=50
"!set viminfo^=!
"!set sessionoptions-=options
"!runtime! macros/matchit.vim
"!set background=dark
"!"auto-create 'backupdir' if 'backup' is set

