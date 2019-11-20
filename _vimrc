" dein
if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')             " Completion
call dein#add('Shougo/neomru.vim')

" Languages
call dein#add('nvie/vim-flake8')                    " Python
call dein#add('elixir-lang/vim-elixir')             " Elixir
call dein#add('plasticboy/vim-markdown')            " Markdown
call dein#add('jimenezrick/vimerl')                 " Erlang
call dein#add('othree/yajs.vim')                    " Java
call dein#add('fatih/vim-go')                       " Golang
call dein#add('OrangeT/vim-csharp')                 " C#
call dein#add('pangloss/vim-javascript')            " Javascript
call dein#add('mxw/vim-jsx')                        " Jsx
call dein#add('leafgarland/typescript-vim')         " TypeScript

" Other
call dein#add('nathanaelkane/vim-indent-guides')    " visually displaying indent levels
call dein#add('thinca/vim-quickrun')
call dein#add('vim-airline/vim-airline')            " vim airline
call dein#add('vim-airline/vim-airline-themes')     " vim airline
call dein#add('ervandew/supertab')                  " allows you to use <Tab> for all your insert completion needs
call dein#add('w0ng/vim-hybrid')
call dein#add('Shougo/unite-outline')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-fugitive')
call dein#add('altercation/vim-colors-solarized')
call dein#add('t9md/vim-quickhl')
call dein#add('Shougo/unite.vim')
call dein#add('hokaccha/vim-html5validator')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('alpaca-tc/alpaca_powertabline')
call dein#add('Lokaltog/powerline-fontpatcher')
call dein#add('airblade/vim-gitgutter')             " display git-diff
call dein#add('tpope/vim-obsession')                " save session
call dein#add('Konfekt/FastFold')

"gist.vim
call dein#add('mattn/gist-vim', {'depends': 'mattn/webapi-vim'})
call dein#add('mattn/webapi-vim')

call dein#end()

if dein#check_install()
    call dein#install()
endif

"gist.vim
let g:gist_detect_filetype=1

let g:SuperTabDefaultCompletionType = "context"
set nocompatible

" -- AirLine --
let g:airline_powerline_fonts = 1
let g:Powerline_symbol = 'fancy'
let g:airline_theme='papercolor'

" Required:
filetype plugin indent on

:let erlang_force_use_vimerl_indent = 0
autocmd FileType erlang setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType go setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

" display histories of command
set wildmenu
set history=5000

" syntax highlight
syntax on
colorscheme hybrid
set background=dark

" other
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a "Google Chrome"'

let g:neocomplete#enable_at_startup = 1

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,tabe :<C-u>tabe<CR>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

set encoding=utf8
set fileencoding=utf-8
set scrolloff=5
set noswapfile
set nowritebackup
set nobackup
set backspace=indent,eol,start
set vb t_vb=
set novisualbell
set clipboard+=unnamed
set clipboard=unnamed
set list
set number
set ruler
set nocompatible
set nostartofline
set matchpairs& matchpairs+=<:>
set showmatch
set matchtime=2
set textwidth=0
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set virtualedit=all
"set cursorline
set laststatus=2
set timeout ttimeoutlen=50
set guifont=Menlo\ for\ Powerline:h15
hi clear CursorLine

autocmd BufWritePre * :%s/\s\+$//ge

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setl completeopt-=preview
autocmd FileType javascript.jsx setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType c++.cpp setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
filetype indent plugin on
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on

augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#rename_command = '<Leader>R'

autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

vnoremap <silent> <C-p> "0p<CR>
inoremap <silent> jj <ESC>
nnoremap Y y$

let mapleader = "\<Space>"

" save file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>

"vim-altr
nnoremap <Leader>h <Plug>(altr-forward)

" surround
nnoremap <Leader>" ciw""<Esc>P
nnoremap <Leader>' ciw''<Esc>P
nnoremap <Leader>` ciw``<Esc>P
nnoremap <Leader>( ciw()<Esc>P
nnoremap <Leader>{ ciw{}<Esc>P
nnoremap <Leader>[ ciw[]<Esc>P

" quickhl
nmap <Leader>m <Plug>(quickhl-manual-this)
xmap <Leader>m <Plug>(quickhl-manual-this)
nmap <Leader>M <Plug>(quickhl-manual-reset)
xmap <Leader>M <Plug>(quickhl-manual-reset)

" moving in normal mode
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>

set rtp+=/usr/local/opt/fzf
