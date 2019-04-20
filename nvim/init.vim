let $NVIM_TUI_ENABLE_TRUE_COLOR=1
call plug#begin()

Plug 'mhartington/oceanic-next'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-sensible'
Plug 'brooth/far.vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
"{{{
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'typescript': ['eslint']
 \ }
"let g:ale_sign_error = '•'
"let g:ale_sign_warning='•'
  let g:ale_sign_error = '✖'
  hi! ALEErrorSign guifg=#DF8C8C ctermfg=167
  let g:ale_sign_warning = '⚠'
  hi! ALEWarningSign guifg=#F2C38F ctermfg=221
  "let g:ale_fix_on_save = 1
"}}}"
Plug 'prettier/prettier'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"{{{ 
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <C-p> :GFiles<CR>
  nnoremap <silent> <leader>ff :Files<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>fw :Windows<CR>
  nnoremap <silent> <leader>fl :BLines<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>fk :Maps<CR>
  nnoremap <silent> <leader>fc :Commands<CR>
  nnoremap <silent> <leader>/ :Rg<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

" }}}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'zchee/nvim-go', { 'do': 'make'}

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

" Toolu
Plug 'vim-airline/vim-airline'
"{{{
  let g:airline_left_sep = "\uE0C6"
  let g:airline_right_sep = "\uE0C7"
  let g:airline_symbols = {}
  let g:airline_symbols.branch = "\ue725"
  let g:airline#extensions#ale#enabled = 1
"}}}"
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'spf13/vim-autoclose'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
" {{{
  let g:indent_guides_default_mapping = 0
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']
" }}}
call plug#end()

""
"" Basic Setup
""

set termguicolors

"colorscheme jellybeans
"colorscheme gruvbox
colorscheme OceanicNext
set background=dark    " Setting dark mode
syntax enable
filetype plugin indent on
set encoding=utf-8
set nocompatible      " Use vim, no vi defaults
set showtabline=2
set linespace=2
set number            " Show line numbers
set ruler             " Show line and column number
set noswapfile        " No Swap Files
set nobackup
set autoindent
set laststatus=2
set showcmd
set hidden
set showmatch
set smarttab
set showmatch " show matching brackets
"set cursorline
set visualbell
set smartindent
set shell=zsh

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Plugin Settings
""

let g:deoplete#enable_at_startup = 1

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {'javascript.jsx' : { 'extends' : 'jsx'}}

" LanguageClient-neovim

let g:LanguageClient_serverCommands = {
      \ 'rust': ['rls'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ 'typescript.jsx': ['javascript-typescript-stdio'],
      \}

let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader><leader> :call LanguageClient#explainErrorAtPoint()<CR>

let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
let g:LanguageClient_rootMarkers = ['.flowconfig']
" let g:LanguageClient_changeThrottle = 1
let g:LanguageClient_diagnosticsEnable = 0

" vim-polyglot
let g:polyglot_disabled=['javascript.jsx', 'javascript']


""
"" Key Mappings
""

"Denite

" nmap ; :Denite buffer -split=floating -winrow=1<CR>
nnoremap <leader>f/ :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>fw :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>nf :NERDTreeFind<CR>

"   <Space> - PageDown
"   -       - PageUp
" noremap <Space> <PageDown>
" noremap - <PageUp>

map <leader>rv :so $MYVIMRC<CR>
nmap <leader>tl :set number! number?<cr>
nmap <leader>tn :NERDTreeToggle<CR>
nnoremap <silent><expr> <Leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

nmap <leader>gs :Gstatus<cr>
nmap <leader>lf :ALEFix<cr>

" Easy toggle between window
nmap <leader>ww <C-w>w
"Close Window
nmap <leader>wq <C-w>q

" upper/lower word
nmap <leader>Wu mQviwU`Q
nmap <leader>Wl mQviwu`Q

" upper/lower first char of word
nmap <leader>WU mQgewvU`Q
nmap <leader>WL mQgewvu`Q
