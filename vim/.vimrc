"-------------------------------------------------VimConfig----------------------------------------
"execute pathogen#infect()

"-------------------------------------------------FileType-----------------------------------------
filetype on
filetype indent on
filetype plugin on
"filetype plugin indent on

:set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
"------------------------------------------------PlugManage---------------------------------------
call plug#begin('~/.vim/plugged')     
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'vim-scripts/TagHighlight'
Plug 'vim-scripts/Tagbar'
"Plug 'simplyzhao/cscope_maps.vim'
"Plug 'vim-scripts/lookupfile'
Plug 'vim-scripts/genutils'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/fencview'
"Plug 'ervandew/ag'
Plug 'skywind3000/asyncrun.vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()

"-------------------------------------------Ag-------------------------
let g:ag_working_path_mode="r"
let g:ag_prg="ag --vimgrep --smart-case -U  --ignore \"cscope.*\" --ignore-dir \".git\" --ignore-dir \".repo\""


"--------------------------------------------YCM--------------------------------------------
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    
"回车即选中当前项
"上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    
"force recomile with syntastic
"
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:clang_user_options='|| exit 0'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
nnoremap <c-]> :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
let g:ycm_key_invoke_completion =' <silent> <F8> '
"强制补全

"-------------------------------------------csccope--------------------------------------------
cscope reset 

"----------------------------------------------highlight------------------------------------------
colorscheme desert  "always use

set t_Co=16
set background=dark
"colorscheme solarized
highlight link CtrlSpaceNormal   PMenu
highlight link CtrlSpaceSelected PMenuSel
highlight link CtrlSpaceSearch   Search
highlight link CtrlSpaceStatus   StatusLine
syntax enable
syntax on
highlight IncSearch ctermbg=yellow ctermfg=Black
highlight Search cterm=bold ctermbg=yellow   ctermfg=Black
highlight Comment ctermfg=darkGrey
highlight PreProc ctermfg=darkred
highlight Statement ctermfg=darkMagenta
highlight String ctermfg=blue
highlight Special ctermfg=blue

"-----------------------------------------------General-------------------------------------------
set backspace=indent,eol,start
set nocompatible
set is
set laststatus=2
set tags=tags;
set hidden
set nowrapscan
set smartcase
set nowrap
":set textwidth=200
set tw=200
set display=lastline
set incsearch
set mouse=n
set tabstop=4
set shiftwidth=4
set expandtab
set ic
set cindent
set autoindent
set smartindent
set ruler
set hlsearch
set fileencodings=ucs-bom,utf-8,cp936,gb18030,GB2312,big5,euc-jp,euc-kr,latinl
"high light
set cursorline
hi CursorLine cterm=bold ctermbg=black
"hi Pmenu ctermbg=black
set wildmenu
set wildmode=list:longest
set autoread
"set showmatch
set number
set noswapfile
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/bundle/ag
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  
"set statusline=%h%w%r\ %f\ %m%=\ %B\ \|\ %{&ff}\ \|\ %{&fenc!=''?&fenc:&enc}\
"\|\ %{&ft!=''?&ft:'none'}\ \|\ %{&tabstop}\ %8(%l,%v%)\ %10(%p%%,%P%)

"-----------------------------------------Airline--------------------------------------------
let g:airline_exclude_preview = 1

"--------------------------------------------PlugConfig------------------------------------------
"----------------------------------------------Ag------------------------------------------------
"let g:ag_working_path_mode="r"
"let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"

"---------------------------------------------CtrlP----------------------------------------------
let g:ctrlp_working_path_mode = 0 "'ra'
let g:ctrlp_by_filename = 0
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_custom_ignore={
            \ 'dir': '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \}
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
"let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
            \ }
"--------------------------------------------TagBar----------------------------------------------
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 40
let g:tagbar_left=1


"-----------------------------------------GitGutterConfig----------------------------------------------
let g:gitgutter_diff_args = '-w'

"------------------------------------------Quickfix----------------------------------------------
"--------------------------------------------KeyMap----------------------------------------------
nmap <F6> :cw<CR>
nmap <space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F3> :TagbarToggle<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>
"inoremap jk <ESC>
inoremap <c-k> <Up>
inoremap <c-j> <Down>
inoremap <c-h> <Left>
inoremap <c-l> <Right>
inoremap <c-a> <Home>
cnoremap <c-j> <t_kd>
cnoremap <c-k> <t_ku>
cnoremap <c-h> <Left>
cnoremap <c-l> <Right>
"cnoremap <c-a> <Home>
"nnoremap ; :
nnoremap gs <C-W><C-W>
nmap <silent> * :nohls<cr>
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <F7> :CtrlSpace<CR>
"nmap <silent> <F8> :CtrlP<CR> 
nmap gk :GitGutterPrevHunk<CR>
nmap gj :GitGutterNextHunk<CR>
nmap gd :GitGutterPreviewHunk<CR>
nmap <leader>v "+gp
nmap <leader>c "+y
let mapleader=","

"inoremap printf printf("\033[43;30m## [DEBUG] %s %s %d\033[0m\n",__FILE__, __FUNCTION__, __LINE__);
"inoremap printf printf();

"-----------------------------------------ShowFunctionName---------------------------------------------
fun! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl Nonei
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

map f :call ShowFuncName() <CR>

"---------------------------------------SaveLastPosition-----------------------------------------------
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif










