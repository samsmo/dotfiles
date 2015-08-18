filetype off " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
" colorscheme plugins
Bundle 'https://github.com/vim-scripts/vim-colorscheme-switcher'
Bundle 'https://github.com/flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'w0ng/vim-hybrid'

" clojure plugins
Bundle "https://github.com/guns/vim-clojure-static"

"Bundle 'vim-scripts/VimClojure'
Bundle "git://github.com/tpope/vim-leiningen.git"
Bundle "git://github.com/tpope/vim-fireplace.git"

" java plugins
Bundle "tpope/vim-classpath"
"
" javascript plugins
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'
Bundle 'https://github.com/tpope/vim-jdaddy'
Bundle 'mxw/vim-jsx'

" html plugins
Bundle 'othree/html5.vim'
Bundle 'mattn/emmet-vim'
Bundle 'digitaltoad/vim-jade'

" css plugins
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'

" haskell plugins
Bundle 'git://github.com/urso/haskell_syntax.vim.git'
Bundle 'https://github.com/lambdatoast/elm.vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Shougo/vimproc.vim'

" tmux plugins
" autocomplete from tmux with <C-X><C-U>
Bundle "wellle/tmux-complete.vim"

" misc plugins
Bundle "scrooloose/syntastic"
Bundle "junegunn/vim-easy-align"
Bundle 'Chiel92/vim-autoformat'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'jpalardy/vim-slime'
Bundle 'https://github.com/tpope/vim-commentary'
Bundle 'https://github.com/xolox/vim-misc'
Bundle "https://github.com/kien/rainbow_parentheses.vim"
Bundle 'calebsmith/vim-lambdify'
Bundle "supertab"
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/vim-argwrap'
Bundle "godlygeek/tabular"
Bundle "tpope/vim-vinegar"
Bundle "maksimr/vim-jsbeautify"
Bundle "einars/js-beautify"
Bundle "gregsexton/MatchTag"
call vundle#end()

syntax on
filetype plugin indent on
set cursorline
set showcmd
set nocompatible
set encoding=utf-8

set ruler
set showmatch
set smartcase
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set softtabstop=2

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter


" clipboard settings
set clipboard^=unnamed

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

inoremap fd <Esc>

" turn off swap files
set noswapfile
set nobackup
set nowb

" scroll throught autocomplete results
set wildmenu

" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

set showmode

" Jump to start and end of line using the home row keys
noremap H ^
noremap L $

" Search and replace word under cursor (,;)
nnoremap <leader>; :%s/\<<C-r><C-w>\>//<Left>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx

  " Clear all autocmds in the group
  autocmd!

  autocmd FileType text setlocal textwidth=78

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

  " filetype specific tab/space config
  autocmd BufRead,BufNewFile *.ascx set ai sw=4 sts=4 et
  autocmd FileType ruby,haml,eruby,yaml,cucumber set ai sw=2 sts=2 et
  autocmd FileType php,python,javascript,coffee,sass,css,scss,html set ai sw=4 sts=4 et
augroup END

autocmd BufRead,BufNewFile *.swig set filetype=haml

" ctrl-e => eval selection
autocmd FileType clojure nnoremap <C-e> :Eval<CR>

" shift+e => eval file
autocmd FileType clojure nnoremap E :%Eval<CR>


" easy align config
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" autoformat config
noremap <leader>af :Autoformat<CR><CR>

let g:hybrid_use_Xresources = 1

set background=dark

colorscheme hybrid

" Control-P config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" vim slime config
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
"xmap <leader>eval <Plug>SlimeRegionSend
"nmap <leader>eval <Plug>SlimeParagraphSend

" RainbowParentheses config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" custom filetypes
au BufNewFile,BufRead *.cljs.hl set filetype=clojure
au BufNewFile,BufRead *.cljs set filetype=clojure
au BufNewFile,BufRead *.cshtml set filetype=html
au BufNewFile,BufRead *.json set filetype=javascript
au BufRead,BufNewFile *.es6 setfiletype javascript

" Font Styles
set guifont=Sauce\ Code\ Powerline:h12

" syntastic/jshint config
let g:syntastic_javascript_checkers = ['eslint']

set timeoutlen=1000 ttimeoutlen=0

" syntastic/scss config
 let g:syntastic_scss_checkers = ['scss_lint']

" vim-expand-region config
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" for use with terryma/vim-expand-region
 vmap v <Plug>(expand_region_expand)
 vmap <C-v> <Plug>(expand_region_shrink)

" statusline config
 set statusline=%t%h%m%r%=[%b\ 0x%02B]\ \ \ %l,%c%V\ %P
 set laststatus=2 " Always show a status line
 set cmdheight=1 " "make the command line 1 line high

" split config
" <space> switches to the next window (give it a second)
:map <space> <c-W>w

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" https://github.com/thoughtbot/dotfiles/blob/master/vimrc
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


" change in next parens
onoremap in( :<c-u>normal! f(vi(<cr>

