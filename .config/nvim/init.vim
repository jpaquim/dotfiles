" Install plug for plugin management, if not already present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


""" Plugins """
call plug#begin()
Plug 'airblade/vim-gitgutter' " git diff in gutter
Plug 'alvan/vim-closetag' " auto close HTML tags
Plug 'chaoren/vim-wordmotion' " CamelCase, - and _ word motions
Plug 'flazz/vim-colorschemes' " colorschemes
Plug 'heavenshell/vim-jsdoc' " easily add jsdoc comment blocks
Plug 'jiangmiao/auto-pairs' " auto close brackets, quotes, etc.
Plug 'mattn/emmet-vim' " html super powers
Plug 'mbbill/undotree' " undo tree visualizer
Plug 'prettier/vim-prettier', { 'do': 'yarn' } " formatter for web src files
Plug 'rhysd/vim-clang-format' " clang format
Plug 'scrooloose/nerdcommenter' " comments
Plug 'scrooloose/nerdtree' " file browser
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-rsi' " readline shortcuts
Plug 'tpope/vim-sleuth' " set indentation length heuristically
Plug 'tpope/vim-surround' " (), [], {}
Plug 'tpope/vim-unimpaired' " useful shortcuts
Plug 'vim-airline/vim-airline' " pretty status bar
Plug 'vim-airline/vim-airline-themes' " themes for airline
Plug 'w0rp/ale' " asynchronous lint engine

Plug 'autozimu/languageclient-neovim',
  \ { 'branch': 'next', 'do': 'bash install.sh' } " support for language servers
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'sheerun/vim-polyglot' " language pack
" Note: before adding a language plugin, check if vim-polyglot doesn't already
" include support for it
Plug 'mhinz/vim-mix-format' " Elixir formatter support
Plug 'jparise/vim-graphql' " graphql support
Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " TypeScript support
Plug 'ziglang/zig.vim'

" Plug 'ctrlpvim/ctrlp.vim' " fuzzy find
" Plug 'honza/vim-snippets' " snippets collection
" Plug 'majutsushi/tagbar' " ctags sidebar
" Plug 'noahfrederick/vim-neovim-defaults' " neovim defaults for vim
" Plug 'SirVer/ultisnips' " snippets engine
" Plug 'tpope/vim-obsession' " save session
call plug#end()


""" Appearance """
set background=dark
" colorscheme solarized
set number " show line numbers
set relativenumber " relative line numbers
set cursorline " highlight current line
set ruler " shows line position
set showcmd " shows current command
set lazyredraw " redraw only when needed
set wrap linebreak nolist " soft wrap
set colorcolumn=81 " highlight 81st column
" let &colorcolumn=join(range(81,500),",") " highlight columns after 80

" set signcolumn=number " show sign column in line number column


""" Tabs """
set expandtab " replace tab with spaces
set tabstop=4 " number of visual spaces per TAB character
set shiftwidth=2 " number of spaces in indentation
set softtabstop=2 " number of spaces in tab when editing


""" Search """
set ignorecase " ignore case in /? and *# searches
set smartcase " except if pattern contains uppercase letters, in /? searches
set wildignorecase " ignore case in when autocompleting in command mode


""" Splits """
set splitbelow " new window goes below
set splitright " new window goes to the right


""" Indentation """
set cinoptions+=g0,i0 " access specifiers are left-aligned


""" Misc """
set mouse=a " enable mouse support in all modes

set undofile " remember undo history across editing sessions

" set clipboard=unnamed " copy to macOS clipboard

set timeoutlen=500 " timeout for key combinations

" return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


""" Keyboard Mappings """

" jk in sucession to return to normal mode
inoremap jk <Esc>
cnoremap jk <Esc>
" vnoremap jk <Esc> " makes scrolling slow

" navigate visual rather than logical lines, compatible with motions
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
vnoremap <expr> j v:count ? 'j' : 'gj'
vnoremap <expr> k v:count ? 'k' : 'gk'

" remap leader to the space bar
map <Space> <Leader>
map <Space><Space> <Leader><Leader>

" edit, save, quit, and save & quit
nnoremap <Leader>e :e
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>E :e!

" append , and ; to to the end of the line
nnoremap <Leader>, m`A,<Esc>``
nnoremap <Leader>; m`A;<Esc>``

" move lines up and down
nnoremap <C-J> :m .+1<CR>==
nnoremap <C-K> :m .-2<CR>==
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv

" scroll with fixed cursor position
nnoremap J j<C-E>
nnoremap K k<C-Y>

" join and split lines
nnoremap m J
nnoremap M m`r<CR>``

nnoremap <C-F> <C-D><C-D>
nnoremap <C-B> <C-U><C-U>

" create tab, switch tab
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

" clear search highlighting
nnoremap <silent><Esc> :nohlsearch<CR>

" go to middle of document
nnoremap gM 50% zz

" global find and replace
nnoremap <Leader>R *N:%s/<C-R>///gc<Left><Left><Left>

" extra readline-like shortcuts in insert mode
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-K> <C-O>d$

" source and edit vim configuration file
nnoremap <Leader>v :so $MYVIMRC<CR>
nnoremap <Leader>V :e $MYVIMRC<CR>

" clang format with leader cf
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" show symbol documentation, go to definition, and rename in scope
nnoremap <silent><Leader>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent><Leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent><Leader>r :call LanguageClient_textDocument_rename()<CR><Paste>

" prettier format with leader f
nmap <Leader>f <Plug>(PrettierAsync)

" toggle NERDTree with <C-N>
map <C-N> :NERDTreeToggle<CR>


""" Plugins """
let g:airline_powerline_fonts = 1 " enable powerline special characters

let g:ale_fix_on_save = 1 " format on save
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'css': ['prettier'],
\}
let g:ale_sign_column_always = 1 " keep gutter always open

let g:clang_format#detect_style_file = 1 " detect config in .clang-format

let g:closetag_filenames = '*.html,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.js,*.jsx'

let g:deoplete#enable_at_startup = 1 " enable autocomplete

" let g:python3_host_prog = '/usr/local/bin/python3'

let g:javascript_plugin_jsdoc = 1 " enable jsdoc syntax support

let g:jsx_ext_required = 0 " enable jsx syntax support in js files

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio']
  \ }

let g:mix_format_on_save = 1 " format on save when editing Elixir

let g:NERDSpaceDelims = 1 " insert a space after comment delimiter
let g:NERDCompactSexyComs = 1 " make sexy comments compact
let g:NERDDefaultAlign = 'left' " align start of line (doesn't work?)
let g:NERDAltDelims_haskell = 1 " -- instead of {- -}
let g:NERDAltDelims_c = 1 " // instead of /* */

let g:prettier#quickfix_enabled = 0
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'

let g:rustfmt_autosave = 1 " format on save when editing Rust

let g:syntastic_cpp_compiler_options = ' -std=c++14'

let g:user_emmet_leader_key='<C-M>' " <C-M>, to launch Emmet
let g:user_emmet_install_global = 0 " enable only for these file types
autocmd FileType html,css EmmetInstall
" autocmd FileType html,css,javascript,jsx EmmetInstall
