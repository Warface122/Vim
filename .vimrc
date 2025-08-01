set mouse=a            " Включение поддержки мыши
set backspace=indent,eol,start
set completeopt=menu,menuone,noselect   "ctrl+n auto-helper
set isfname+=@
set wrapscan
set hlsearch
set incsearch
set guioptions-=m   	   "Turn off Menu    	
set guioptions-=T   	   "Turn off Panel settings
set guioptions-=l	       "Turn off left slider	
set guioptions-=r    	   "Turn off right slider
set timeout timeoutlen=10
set termguicolors
set number                   " Включение номеров строк
set noswapfile
"set clipboard=unnamedplus    " Включение системного буфера обмена
"set guitablabel=%t%m
"set lines=50
"set columns=150

" Настройка выхода из всех режимов при нажатии Esc
inoremap <Esc> <Esc>         " Выход из режима вставки
vnoremap <Esc> <Esc>         " Выход из визуального режима
cnoremap <Esc> <C-c>         " Выход из командной строки

" Горячие клавиши для вкладок
nnoremap <C-q> :tabp<CR>  " Переключение на предыдущую вкладку
nnoremap <C-e> :tabn<CR>      " Переключение на следующую вкладку
nnoremap <C-l> :execute 'tabnew' fnameescape(expand('<cfile>')) <CR>
autocmd TabEnter * silent! lcd %:p:h

" Открытие файла по ссылке в текущем окне (сплите) через Alt+l
nnoremap <A-l> :silent! execute 'edit ' . fnameescape(expand('<cfile>')) \| lcd %:p:h<CR>

nnoremap <C-x> :b#<CR>

" Переход на следующий буфер (файл)
nnoremap <A-e> :bnext<CR>

" Переход на предыдущий буфер (файл)
nnoremap <A-q> :bprevious<CR>

" Включение подсветки синтаксиса
syntax enable

" Горячие клавиши для окон
nnoremap <C-w> <C-w>w           " Переключение между окнами

" Автооткрытие NERDTree при запуске, если открыта папка
"autocmd VimEnter * NERDTree
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_' && winnr('$') == 1 | quit | endif

" Инициализация менеджера плагинов Vim-Plug
call plug#begin('~/.vim/plugged')

" Установка плагинов
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'gkeep/iceberg-dark'
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'    "itchyny/lightline.vim analog 
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Установка цветовой схемы
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

" Включение vim-airline и использование цветовой схемы 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#left_sep = '  '
let g:airline#extensions#tabline#left_alt_sep = '  '
let g:airline#extensions#tabline#right_sep = '  '
let g:airline#extensions#tabline#right_alt_sep = '  '
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1

" Горячая клавиша для замены текста во всем файле (Alt+R)
nnoremap <M-r> :%s/\<<C-r><C-w>\>//g<Left><Left>

" Горячие клавиши для копирования в системный буфер
nnoremap <C-C> "+y
vnoremap <C-C> "+y
imap <C-V> <C-R>+

" Горячие клавиши для NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>    " Открыть/закрыть NERDTree
nnoremap <A-k> :execute 'rightbelow vsplit ' . expand('<cfile>') \| wincmd L<CR>
nnoremap <A-h> :execute 'rightbelow split ' . expand('<cfile>') \| wincmd L<CR>

" Перемещение строки вверх при нажатии Alt+Up
nnoremap <M-Up> :m .-2<CR>==

" Перемещение строки вниз при нажатии Alt+Down
nnoremap <M-Down> :m .+1<CR>==

" Перемещение выделенных строк вверх при нажатии Alt+Up в визуальном режиме
vnoremap <M-Up> :m '<-2<CR>gv=gv

" Перемещение выделенных строк вниз при нажатии Alt+Down в визуальном режиме
vnoremap <M-Down> :m '>+1<CR>gv=gv

"For diff 
nnoremap <A-f> :windo diffthis<CR>
nnoremap <A-F> :windo diffoff<CR>

