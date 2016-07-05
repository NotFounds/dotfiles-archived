"NeoBundle
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleLazy 'mxw/vim-jsx', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript']}}
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'othree/yajs.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'fatih/vim-go'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundleLazy 'kana/vim-altr'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle "t9md/vim-quickhl"
NeoBundle 'ervandew/supertab'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'bling/vim-airline'
NeoBundleLazy 'nosami/Omnisharp', {
\   'autoload': {'filetypes': ['cs']},
\   'build': {
\     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   }
\ }
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'ryo33/powerful-type.vim'
call neobundle#end()

let g:SuperTabDefaultCompletionType = "context"
set nocompatible
"set statusline+=%{fugitive#statusline()}

" -- AirLine --
let g:airline_powerline_fonts = 1
let g:Powerline_symbol = 'fancy'
let g:airline_theme='papercolor'

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" Required:
filetype plugin indent on

NeoBundleCheck
"/NeoBundle
:let erlang_force_use_vimerl_indent = 0
autocmd FileType erlang setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType go setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

" -- Solarized --
"set t_Co=256
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256 "16
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=1
"let g:solarized_contrast='normal'
"let g:solarized_visibility='normal'

colorscheme hybrid

syntax on
set background=dark
"let g:solarized_termtrans = 1
"colorscheme solarized

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
"vim-altr
nnoremap <Leader>h <Plug>(altr-forward)

syntax on
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
set matchtime=3
set textwidth=0
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set virtualedit=all
set cursorline
set laststatus=2
set guifont=Menlo\ for\ Powerline:h15
hi clear CursorLine

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setlocal completeopt-=preview

autocmd FileType javascript.jsx setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

autocmd FileType c++.cpp setl tabstop=4 expandtab shiftwidth=4 softtabstop=4


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
