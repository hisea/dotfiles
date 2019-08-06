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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fszymanski/fzf-quickfix'
"{{{ 
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
Plug 'zchee/nvim-go', { 'do': 'make'}

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

" COC
Plug 'Shougo/denite.nvim'
Plug 'neoclide/denite-extra'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-denite'

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

" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

" === Coc.nvim === "
" :CocInstall coc-lists coc-tsserver coc-eslint coc-json coc-prettier coc-css
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <silent> <leader>lj <Plug>(coc-implementation)
nmap <silent> <leader>lt <Plug>(coc-type-definition)

nnoremap <silent> <space>d  :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
nnoremap <silent> <space>w  :<C-u>CocList symbols<CR>
nnoremap <silent> <space>b  :<C-u>CocList buffers<CR>
nnoremap <silent> <space>m  :<C-u>CocList mru<CR>
nnoremap <silent> <space>s  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent> <space>S  :exe 'CocList --normal grep '.expand('<cword>').''<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

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
