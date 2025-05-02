set mouse=a            " Включение поддержки мыши
set backspace=indent,eol,start
set completeopt=menu,menuone,noselect   " Включение автодополнения с меню
set isfname+=@
set wrapscan
set hlsearch           " Подсветка всех совпадений при поиске
set incsearch          " Поиск при вводе (интерактивный)
set guioptions-=m          " Отключение меню        
set guioptions-=T          " Отключение панели настроек
set guioptions-=l          " Отключение левого скроллбара   
set guioptions-=r          " Отключение правого скроллбара
set timeout timeoutlen=500   " Увеличенное время ожидания для избежания проблем с сочетаниями клавиш
set clipboard=unnamedplus    " Использование системного буфера обмена
set termguicolors
set number                   " Включение номеров строк

" Настройка выхода из всех режимов при нажатии Esc
inoremap <Esc> <Esc>         " Выход из режима вставки
vnoremap <Esc> <Esc>         " Выход из визуального режима
cnoremap <Esc> <C-c>         " Выход из командного режима

" Горячие клавиши для вкладок
nnoremap <M-q> :tabp<CR>      " Переключение на предыдущую вкладку
nnoremap <M-e> :tabn<CR>      " Переключение на следующую вкладку
nnoremap <M-l> :execute 'tabnew' fnameescape(expand('<cfile>')) <CR>
autocmd TabEnter * silent! lcd %:p:h   " Изменение текущей директории при смене вкладки

nnoremap <M-x> :b#<CR>    " Переключение между буферами
nnoremap <M-S-k> :e <cfile><CR>   " Открытие файла под курсором

" Включение подсветки синтаксиса
syntax enable

" Горячие клавиши для работы с окнами
nnoremap <M-w> <C-w>w           " Переключение между окнами

" Автооткрытие NERDTree при запуске, если открыта папка
"autocmd VimEnter * NERDTree
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_' && winnr('$') == 1 | quit | endif

" Инициализация менеджера плагинов Vim-Plug
call plug#begin('~/.vim/plugged')

" Установка плагинов
Plug 'morhetz/gruvbox'          " Цветовая схема Gruvbox
Plug 'arzg/vim-colors-xcode'     " Цветовая схема Xcode
Plug 'gkeep/iceberg-dark'        " Цветовая схема Iceberg
Plug 'cocopon/iceberg.vim'       " Цветовая схема Iceberg
Plug 'vim-airline/vim-airline'   " Статусная строка Airline (альтернатива lightline.vim)
Plug 'joshdick/onedark.vim'      " Цветовая схема OneDark
Plug 'arcticicestudio/nord-vim'  " Цветовая схема Nord
Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " Плагин для мульти-курсоров
Plug 'preservim/nerdtree'        " Файловый менеджер NERDTree
Plug 'ryanoasis/vim-devicons'    " Иконки для файлов

call plug#end()

" Установка цветовой схемы
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

" Включение vim-airline и настройка его параметров
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#left_sep = '  '
let g:airline#extensions#tabline#left_alt_sep = '  '
let g:airline#extensions#tabline#right_sep = '  '
let g:airline#extensions#tabline#right_alt_sep = '  '
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1

" Горячая клавиша для замены текста во всем файле (Alt+Shift+R)
nnoremap <M-S-r> :%s/\<<C-r><C-w>\>//g<Left><Left>

" Горячие клавиши для копирования и вставки в системный буфер
nnoremap <M-C> "+y                " Копирование в системный буфер
vnoremap <M-C> "+y                " Копирование выделенного текста в системный буфер
imap <M-V> <C-R>+                 " Вставка текста из буфера обмена    

" Горячие клавиши для NERDTree
nnoremap <M-t> :NERDTreeToggle<CR>    " Открыть/закрыть NERDTree

" Перемещение строки вверх при нажатии Alt+Up
nnoremap <M-Up> :m .-2<CR>==

" Перемещение строки вниз при нажатии Alt+Down
nnoremap <M-Down> :m .+1<CR>==

" Перемещение выделенных строк вверх при нажатии Alt+Up в визуальном режиме
vnoremap <M-Up> :m '<-2<CR>gv=gv

" Перемещение выделенных строк вниз при нажатии Alt+Down в визуальном режиме
vnoremap <M-Down> :m '>+1<CR>gv=gv
