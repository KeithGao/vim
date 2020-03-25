git clone https://github.com/KeithGao/vim.git ~/

Ack安装
1.wget https://beyondgrep.com/ack-v3.2.0
2.ssudo mv ./ack-v3.2.0 /usr/bin/ack
3.sudo chmod 0755 ./ack

ack.vim配置
1.vim ~/.vim/.vimrc
2.配置
Plugin 'mileszs/ack.vim'
nnoremap <Leader>a :Ack!<CR>

vim YouCompleteMe安装：
0.sudo apt install build-essential cmake python3-dev
1.cd ~/.vim/bundle
2.git clone 
3.cd ./YouCompleteMe && ./install.py --clang-completer

tagbar安装：
需先安装ctags
       1.sudo apt install ctags
2.vimrc配置文件中添加：
"tagbar
Bundle 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>             "快捷键设置
" ubuntu install ctags  $ sudo apt install ctags
let g:tagbar_ctags_bin='/usr/bin/ctags'       "ctags程序的路径
let g:tagbar_width=30                         "窗口宽度的设置
map <F> :Tagbar<CR>
3.vim
4.:PluginInstall
