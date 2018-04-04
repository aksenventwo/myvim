" 文档请阅读https://github.com/VundleVim/Vundle.vim/blob/master/README_ZH_CN.md

set encoding=utf-8
set mouse=a
syntax on
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/bundle/plugins')

" 这些插件你需要在vim中这样安装：
" :PluginInstall
Plugin 'tmhedberg/SimpylFold'              " 用于折叠代码
Plugin 'jnurmine/Zenburn'                  " 用于终端的配色方案
Plugin 'scrooloose/nerdtree'               " NERDTree
Plugin 'kien/ctrlp.vim'                    " 在vim中按ctrl+P搜索文件
Plugin 'rkulla/pydiction'                  " 用于python自动补全
Plugin 'vim-scripts/taglist.vim'           " 显示方法列表
Plugin 'airblade/vim-gitgutter'            " git高亮，查看改动
Plugin 'hdima/python-syntax'               " python syntax highlight
Plugin 'sickill/vim-monokai'
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap <Down><Down> 25j
" nnoremap <Up><Up> 25k
nnoremap <C-N> :NERDTree<CR>
nnoremap <C-T> :TlistOpen<CR>
nnoremap <C-Q> :q<CR>
nnoremap <2-LeftMouse> *


" buffer
set hidden " 避免必须保存修改才可以跳转buffer
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>l :ls<CR>
" MiniBufExpr Toggle
nnoremap <C-M> :MBEToggle<CR>
nnoremap <F7> :make<CR>:cope<CR> 

" nnoremap <Leader>1 :1b<CR>
" nnoremap <Leader>2 :2b<CR>
" nnoremap <Leader>3 :3b<CR>
" nnoremap <Leader>4 :4b<CR>
" nnoremap <Leader>5 :5b<CR>
" nnoremap <Leader>6 :6b<CR>
" nnoremap <Leader>7 :7b<CR>
" nnoremap <Leader>8 :8b<CR>
" nnoremap <Leader>9 :9b<CR>
" nnoremap <Leader>0 :10b<CR>


" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1 " 折叠代码但不折叠__doc__

" Enable folding with the spacebar
nnoremap <space> za


" 使py文件支持支持PEP8风格的缩进
au BufNewFile,BufRead *.py 
  \ set tabstop=4 | 
  \ set softtabstop=4 | 
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix |

au BufNewFile,BufRead *.js, *.html, *.css 
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |


" 配置配色方案
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  " colorscheme zenburn
  colorscheme monokai
endif
" call togglebg#map("<F5>")

" 在NERDTree中忽略指定后缀的文件
let NERDTreeIgnore=['\.pyc$', '\~$']

set nu  " 显示行号
set clipboard=unnamed " 在mac内支持系统剪贴板

" python自动补全配置
let g:pydiction_location = '~/.vim/bundle/plugins/pydiction/complete-dict'
let g:pydiction_menu_height = 3
" 如果你想加入某个库的自动补全可以这样：
" python /path/to/pydiction/pydiction.py tensorflow

" vim状态栏powerline设置
set laststatus=2
set showtabline=2
set noshowmode

" jedi
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<TAB>"
let g:jedi#rename_command = "<leader>r"

" taglist
let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=0
set tags=tags
set autochdir

" gitgutter 多余下面这个数字就不再提示了
let g:gitgutter_max_signs = 500

" 代码检查支持c++11
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" 打开python代码高亮
" let python_highlight_all=1
" let python_version_2=1

hi Normal ctermbg=Black
