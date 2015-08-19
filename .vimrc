set nocompatible             
filetype off        
filetype plugin on
filetype plugin indent on 
set autoindent
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

set rtp+=~/.vim/bundle/Vundle.vim
set foldmethod=indent
set foldlevel=1
setlocal foldmethod=syntax

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'git://github.com/pangloss/vim-javascript'
Plugin 'git://github.com/SirVer/ultisnips.git'
Plugin 'git://github.com/junegunn/vim-easy-align'
Plugin 'git://github.com/scrooloose/nerdcommenter'
Plugin 'git://github.com/xuhdev/SingleCompile'
Plugin 'git://github.com/scrooloose/syntastic'
Plugin 'git://github.com/scrooloose/nerdtree'
Plugin 'git://github.com/flazz/vim-colorschemes'
Plugin 'git://github.com/Lokaltog/vim-powerline'
Plugin 'git://github.com/sjl/gundo.vim'
Plugin 'git://github.com/tomasr/molokai'
Plugin 'git://github.com/tpope/vim-fugitive'
Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'git://github.com/maksimr/vim-jsbeautify'
Plugin 'git://github.com/einars/js-beautify'
Plugin 'git://github.com/Raimondi/delimitMate'
Plugin 'git://github.com/airblade/vim-gitgutter'
Plugin 'git://github.com/editorconfig/editorconfig-vim.git'
call vundle#end()           
  
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:EditorConfig_indent_size = 2

noremap <C-+> :ZoomIn
noremap <C-i> :call JsBeautify()<CR>
noremap <F1> :NERDTree<CR>
noremap <F5> :GundoToggle<CR>
noremap <F6> :UltiSnipsEdit<CR>
noremap <F7> :vsp ~/.vimrc<CR>
noremap <F8> :source $MYVIMRC<CR>
inoremap kj <Esc>
nnoremap <Space> za
nmap <F9> :SCCompileRun<cr>
nmap \q :nohlsearch<CR>
map  <C-l> :tabnext<CR>
map  <C-h> :tabprevious<CR>
map  <C-n> :tabnew<CR>
map <C-x> :tabclose<CR>
set t_Co=256

"color solarized
"color Monokai
"color badwolf
"color xoria256
"color zenburn
"color stingray
"color herald
"color 256-grayvim

syntax enable
set background=dark
set incsearch
set ignorecase
set smartcase
set hlsearch
set cursorline
set nocompatible " use indentation of previous line
set autoindent " use intelligent indentation for C
set smartindent " configure tabwidth and insert spaces instead of tabs
set tabstop=4 " tab width is 4 spaces
set shiftwidth=4 " indent also with 4 spaces
set expandtab " expand tabs to spaces
set number
set backspace=indent,eol,start
set noswapfile
set nobackup
set nowritebackup
set clipboard=unnamedplus "tells vim to use system clipboard as defualt registe
set autoread " reload files (no local changes)
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set undofile
endif

" Remember folds
augroup CplusplusCmds
    " compile c++ without SingleCompile Plugin
    "autocmd FileType cpp nnoremap <buffer> <F9> :!g++ % && ./a.out <cr>

    "replace int with long long in a cpp file
    function! ReplaceIntWithLL()
        %s/int /long long /g
        %s/long long main/int main/g
        %s/<int>/<long long>/g
    endfunction

    "makes a file in and copies current clipboard content into it"
    function! MakeInputFile()
        vsp in 
        normal gg"_dG
        normal P
        w
        quit
    endfunction

    function! DeleteBlankLines()
        g/^$/d
    endfunction

    nnoremap nkl :0r ~/template.cpp<CR>
    noremap <leader>i :call MakeInputFile()<CR>
    command! Makell :call ReplaceIntWithLL()
    command! DeleteBlanks :call DeleteBlankLines()
augroup END
