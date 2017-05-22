" Install plug, for plugin management
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


""" Plugins """
call plug#begin()
Plug 'ervandew/supertab'        " tab autocompletion
Plug 'lervag/vimtex'            " latex support
Plug 'flazz/vim-colorschemes'   " colorschemes
Plug 'rhysd/vim-clang-format'   " clang format
Plug 'rust-lang/rust.vim'       " support for Rust
Plug 'scrooloose/nerdcommenter' " comments
Plug 'scrooloose/nerdtree'      " file browser
Plug 'scrooloose/syntastic'     " syntax checking
Plug 'tpope/vim-rsi'            " readline shortcuts
Plug 'tpope/vim-surround'       " (), [], {}
Plug 'tpope/vim-unimpaired'     " useful shortcuts
Plug 'vim-airline/vim-airline'  " pretty status bar
Plug 'vim-airline/vim-airline-themes' " themes for airline
Plug 'tmux-plugins/vim-tmux'    " better editing for .tmux.conf


" Plug 'ctrlpvim/ctrlp.vim'       " fuzzy find
" Plug 'SirVer/ultisnips'         " snippets engine
" Plug 'honza/vim-snippets'       " snippets collection
" Plug 'tpope/vim-fugitive'       " git
" Plug 'tpope/vim-obsession'      " save session
" Plug 'bkad/CamelCaseMotion'     " CamelCase and underscore word motions
" Plug 'airblade/vim-gitgutter'   " git diff in gutter
" Plug 'majutsushi/tagbar'        " ctags sidebar
call plug#end()


""" Appearance """
set background=dark
colorscheme solarized
set number         " show line numbers
set relativenumber " relative line numbers
set cursorline     " highlight current line
set ruler          " shows line position
set showcmd        " shows current command
set lazyredraw     " redraw only when needed
set wrap linebreak nolist " soft wrap
set colorcolumn=81 " highlight 81st column
" let &colorcolumn=join(range(81,500),",") " highlight columns after 80


""" Tabs """
set expandtab     " replace tab with spaces
set tabstop=4     " number of visual spaces per TAB
set shiftwidth=4  " number of spaces in indentation
set softtabstop=4 " number of spaces in tab when editing


""" Search """
set ignorecase   " ignore case in /? and *# searches
set smartcase    " except if pattern contains uppercase letters, in /? searches
" set iskeyword-=_ " navigate underscore separated words with w, e, b, etc.


""" Splits """
set splitbelow " new window goes below
set splitright " new window goes to the right

""" Indentation """
set cinoptions+=g0,i0 " access specifiers are left-aligned


""" Keyboard Mappings """
set timeoutlen=500 " timeout for key combinations
" jk in sucession to return to normal mode
inoremap jk <Esc>
cnoremap jk <Esc>
" vnoremap jk <Esc> " makes scrolling slow

" navigate visual rather than logical lines, compatible with motions
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" leader from \ to the space bar
map <Space> <Leader>
map <Space><Space> <Leader><Leader>

" leader+e/w/q/x to edit/save/quit/save+quit
nnoremap <Leader>e :e 
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>E :e! 

" move lines up and down with J/K
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" switch window with <C-direction>
nnoremap <BS> <C-W>h
" nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" create tab with <C-t>t, switch tab with <C-t>direction
nnoremap <C-T>t :tabnew<CR>
nnoremap <C-T>l :tabn<CR>
nnoremap <C-T>h :tabp<CR>
nnoremap <C-T><C-T> :tabnew<CR>
nnoremap <C-T><C-L> :tabn<CR>
nnoremap <C-T><C-H> :tabp<CR>

" switch buffer with arrow keys
map <Left> :bp<CR>
map <Right> :bn<CR>
map <Up> :bp<CR>
map <Down> :bn<CR>

" clear search highlighting with Esc
nnoremap <Esc> :noh<CR>

" go to middle of document with gM
nnoremap gM 50% zz

" rename variable globally with confirmation
" nnoremap gr *N:%s///gc<left><left><left>
" rename variable globally without confirmation
" nnoremap gR *N:%s///g<left><left>
" rename local variables with gr
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" rename global variables with gR
nnoremap gR gD:%s/<C-R>///gc<left><left><left>


" extra readline shortcuts
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-K> <C-O>d$

" auto-close C-style bracket scopes
inoremap {<CR> {<CR>}<Esc>ko

" autoformat with leader cf
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" toggle NERDTree with <C-N>
map <C-N> :NERDTreeToggle<CR>


""" Plugins """
let g:airline_powerline_fonts = 1 " enable powerline special characters
let g:clang_format#detect_style_file = 1

let g:NERDSpaceDelims = 1 " insert a space after comment delimiter
let g:NERDCompactSexyComs = 1 " make sexy comments compact
let g:NERDDefaultAlign = 'left' " align start of line (doesn't work?)
let g:NERDAltDelims_haskell = 1 " -- instead of {- -}
let g:NERDAltDelims_c = 1 " // instead of /* */
let g:syntastic_cpp_compiler_options = ' -std=c++14'


""" Misc """
set clipboard=unnamed " copy to OS X clipboard

" return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


""" Defaults for nvim """
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
