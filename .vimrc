    set nocompatible  
    set rtp+=~/.vim/bundle/vundle/  
    call vundle#rc()  

    "paste mode toggle
    set pastetoggle=<F9>
    
    set noswapfile
    " let Vundle manage Vundle  
    " required!  
    Bundle 'gmarik/vundle'  

    Bundle 'Valloric/YouCompleteMe'

    " The bundles you install will be listed here  
    Bundle 'scrooloose/nerdtree'  
    Plugin 'davidhalter/jedi-vim'  

    "ack
    Plugin 'mileszs/ack.vim'
    "nnoremap <Leader>a :Ack!<Space>
    nnoremap <Leader>a :Ack!<CR>

    "vim-vue
    Bundle 'posva/vim-vue'

    "tagbar
    Bundle 'majutsushi/tagbar'

    nmap <Leader>tb :TagbarToggle<CR>             "快捷键设置
    "ubuntu install ctags  $ sudo apt install ctags
    let g:tagbar_ctags_bin='/usr/bin/ctags'       "ctags程序的路径
    let g:tagbar_width=30                         "窗口宽度的设置
    map <F4> :Tagbar<CR>

    "vim-fugitive
    Plugin 'tpope/vim-fugitive'

    "set crtlp.vim
    set runtimepath^=~/.vim/bundle/ctrlp.vim

    "autopep8
    "Plugin 'tell-k/vim-autopep8'
    "let g:autopep8_disable_show_diff=0
    "let g:autopep8_max_line_length=100
    "autocmd FileType python noremap <buffer> <F3> :call Autopep8()<CR>

    "autoformat
    Plugin 'Chiel92/vim-autoformat'
    noremap <F3> :Autoformat<CR>
    "let g:autoformat_verbosemode=1
    let g:formatter_yapf_style = 'pep8'
    "let g:autoformat_autoindent=0
    "let g:autoformat_retab=0
    "let g:autoformat_remove_trailing_spaces=0

    "filetype plugin on
    let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
    let g:pydiction_menu_height = 6
    
    filetype plugin indent on  

    " The rest of your config follows here.  

    augroup vimrc_autocmds  
    autocmd!  
    " highlight characters past column 120  
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black  
    autocmd FileType python match Excess /\%120v.*/  
    autocmd FileType python set nowrap  
    autocmd FileType vue syntax sync fromstart
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
    augroup END  

    " NerdTree Shortcut.  
    map <f2> :NERDTreeToggle<cr>  

    " automatically change window’s cwd to file’s dir  
    set autochdir  
    autocmd vimenter * NERDTree

    " Prefer spaces to tabs  
    set tabstop=4  
    set shiftwidth=4  
    set expandtab  
    set nu!  

    let g:ackprg = 'ag --vimgrep'

    " powerline 4 vim.nox-py2
    set rtp+=/home/keith/.local/lib/python2.7/site-packages/powerline/bindings/vim

    " These lines setup the environment to show graphics and colors correctly.
    set nocompatible
    set t_Co=256
 
    let g:minBufExplForceSyntaxEnable = 1
    " python from powerline.vim import setup as powerline_setup
    " python powerline_setup()
    " python del powerline_setup
 
    if ! has('gui_running')
        set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
    endif
 
    set laststatus=2 " Always display the statusline in all windows
    set guifont=Inconsolata\ for\ Powerline:h14
    set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

    "自动补全配置
    set completeopt=longest,menu
    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    "离开插入模式后自动关闭预览窗口
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
    "回车即选中当前项
    "上下左右键的行为 会显示其他信息
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

    "youcompleteme  默认tab  s-tab 和自动补全冲突
    "let g:ycm_key_list_select_completion=['<c-n>']
    let g:ycm_key_list_select_completion = ['<Down>']
    "let g:ycm_key_list_previous_completion=['<c-p>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    "关闭加载.ycm_extra_conf.py提示
    let g:ycm_confirm_extra_conf=0

    "开启YCM基于标签引擎
    let g:ycm_collect_identifiers_from_tags_files=1
    " 从第2个键入字符就开始罗列匹配项
    let g:ycm_min_num_of_chars_for_completion=2
    " let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
    let g:ycm_seed_identifiers_with_syntax=1  " 语法关键字补全
    let g:ycm_cache_omnifunc = 1
    let g:ycm_use_ultisnips_completer = 1

    "force recompile with syntastic
    nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
    "open locationlist
    nnoremap <leader>lo :lopen<CR>
    "close locationlist
    nnoremap <leader>lc :lclose<CR>
    inoremap <leader><leader> <C-x><C-o>
    "在注释输入中也能补全
    let g:ycm_complete_in_comments = 1
    "在字符串输入中也能补全
    let g:ycm_complete_in_strings = 1
    "注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 0

    " 设置在下面几种格式的文件上屏蔽ycm
    let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'notes' : 1,
        \ 'markdown' : 1,
        \ 'unite' : 1,
        \ 'text' : 1,
        \ 'vimwiki' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \ 'mail' : 1
        \}

    " 跳转到定义处
    nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
