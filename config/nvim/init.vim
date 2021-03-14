call plug#begin()
"Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
"Plugins
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
 \ '*': ['remove_trailing_lines', 'trim_whitespace'],
 \ 'javascript': ['prettier', 'eslint'],
 \ 'typescript': ['prettier', 'eslint']
 \ }
  let g:ale_sign_error = '✖'
  hi! ALEErrorSign guifg=#DF8C8C ctermfg=167
  let g:ale_sign_warning = '•'
  hi! ALEWarningSign guifg=#F2C38F ctermfg=221
  nmap <leader>lf :ALEFix<cr>

  let g:ale_completion_enabled = 0
  "let g:ale_fix_on_save = 1
"}}}"
Plug 'prettier/prettier'
Plug 'skywind3000/asyncrun.vim'
Plug $BREW_DIR . '/opt/fzf/'
Plug 'junegunn/fzf.vim'
Plug 'fszymanski/fzf-quickfix'
"{{{
  let g:fzf_layout = { 'down': '~30%' }
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  let g:fzf_quickfix_use_loclist = 1

  nnoremap <silent> <leader>pf :GFiles<CR>
  nnoremap <silent> <C-p> :GFiles<CR>
  nnoremap <silent> <leader>ff :Files<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>fl :BLines<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>fk :Maps<CR>
  nnoremap <silent> <leader>fc :Commands<CR>
  nnoremap <silent> <leader>/ :Rg<CR>
  nnoremap <silent> <Leader>fw :Rg <C-R><C-W><CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>
  nnoremap <silent> <Leader>fq :Quickfix<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

" }}}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'jparise/vim-graphql'

" Tools
Plug 'vim-airline/vim-airline'
"{{{
  let g:airline_left_sep = "\uE0C6"
  let g:airline_right_sep = "\uE0C7"
  let g:airline_symbols = {}
  let g:airline_symbols.branch = "\ue725"
  let g:airline#extensions#ale#enabled = 1
  let g:airline_extensions = ['branch', 'hunks', 'coc']
  " Custom setup that removes filetype/whitespace from default vim airline bar
  let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

  let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

  let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
"}}}"
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
"{{{
  " === Nerdtree shorcuts === "
  "  <leader>n - Toggle NERDTree on/off
  nmap <leader>n :NERDTreeToggle<CR>
  "  <leader>f - Opens current file location in NERDTree
  nmap <leader>fn :NERDTreeFind<CR>
"}}}"
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jceb/vim-orgmode'
"{{{
:let g:org_todo_keywords=['TODO(t)', 'WIP(w)', 'BLOCKED(b)', 'VERIFY(v)', '|', 'DONE(d)', 'DELEGATED(g)']
"}}}"
Plug 'spf13/vim-autoclose'
let g:polyglot_disabled = ['zig']
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
"{{{
  let g:NERDCreateDefaultMappings = 0
  map <leader>c <plug>NERDCommenterToggle<CR>
  vmap <leader>c <plug>NERDCommenterToggle gv
"}}}"
Plug 'simnalamburt/vim-mundo'
"{{{
  map <leader>m :MundoToggle<CR>
"}}}"
Plug 'andymass/vim-tradewinds'
Plug 'jbgutierrez/vim-better-comments'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
"{{{
  nmap <leader>gs :Gstatus<cr>
  nmap <leader>gb :Gblame<cr>
"}}}"
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
" {{{
  let g:indent_guides_default_mapping = 0
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_start_level = 2
  let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']
  map <leader>ti :IndentGuidesToggle<CR>
" }}}
Plug 'vimlab/split-term.vim'
Plug 'thekelvinliu/kwbd'
"{{{
nmap <leader>bd <plug>(kwbd)
"}}}

" Tmux
if !empty($TMUX)                    " vim + tmux integration
  Plug 'roxma/vim-tmux-clipboard'
  Plug 'tmux-plugins/vim-tmux-focus-events'

  " When Tmux 'focus-events' option is on, Tmux will send <Esc>[O when the
  " window loses focus and <Esc>[I when it gains focus.
  exec "set <F24>=\<Esc>[O"
  exec "set <F25>=\<Esc>[I"
endif

call plug#end()

"
"  Basic Setup
"

set mmp=5000

" Colorscheme
set termguicolors
"colorscheme jellybeans
"colorscheme gruvbox
colorscheme OceanicNext

set fcs=eob:\
set background=dark    " Setting dark mode
syntax enable
filetype plugin indent on
set encoding=utf-8
set nocompatible      " Use vim, no vi defaults
set showtabline=2
set linespace=2
"set number            " Show line numbers
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

hi htmlArg gui=italic cterm=italic
hi Comment gui=italic cterm=italic
hi Type    gui=italic cterm=italic
"hi Keyword gui=italic cterm=italic
hi CustomItalic gui=italic cterm=italic
call matchadd('CustomItalic', '\<import\>')
call matchadd('CustomItalic', '\<from\>')
call matchadd('CustomItalic', '\<const\>')
call matchadd('CustomItalic', '\<let\>')
call matchadd('CustomItalic', '\<async\>')
call matchadd('CustomItalic', '\<await\>')

""
"" Plugin Settings
""
set scl=yes " Fix flickering on text input
let g:deoplete#enable_at_startup = 1

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {'javascript.jsx' : { 'extends' : 'jsx'}}

" vim-polyglot
let g:polyglot_disabled=['javascript.jsx', 'javascript']

""
"" Key Mappings
""

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %


"   <Space> - PageDown
"   -       - PageUp
" noremap <Space> <PageDown>
" noremap - <PageUp>

map <leader>rv :so $MYVIMRC<CR>

nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
" Easy toggle between window
nmap <leader>ww <C-w>w
"Close Window
nmap <leader>wd <C-w>c

" upper/lower word
nmap <leader>Wu mQviwU`Q
nmap <leader>Wl mQviwu`Q

" upper/lower first char of word
nmap <leader>WU mQgewvU`Q
nmap <leader>WL mQgewvu`Q

" Map command-[ and command-] to indenting or outdenting
" while keeping the original selection in visual mode
vmap <leader>] >gv
vmap <leader>[ <gv

nmap <leader>] >>
nmap <leader>[ <<

omap <leader>] >>
omap <leader>[ <<

imap <leader>] <Esc>>>i
imap <leader>[ <Esc><<i

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
