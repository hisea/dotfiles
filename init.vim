call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-sensible'
Plug 'Shougo/denite.nvim'
Plug 'brooth/far.vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'prettier/prettier'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'zchee/nvim-go', { 'do': 'make'}

" Tools
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'spf13/vim-autoclose'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

""
"" Basic Setup
""

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

""
"" Key Mappings
""

nmap <leader>ll :set number! number?<cr>
" upper/lower word
nmap <leader>Wu mQviwU`Q
nmap <leader>Wl mQviwu`Q

" upper/lower first char of word
nmap <leader>WU mQgewvU`Q
nmap <leader>WL mQgewvu`Q
