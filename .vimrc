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
set clipboard=unnamedplus    " Включение системного буфера обмена
set termguicolors
set number                   " Включение номеров строк
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

" -----------------------------------------------
" Открытие файла из обычного буфера (по ссылке) через Alt+l
" -----------------------------------------------
" Эта команда открывает файл, имя которого берётся из <cfile>,
" в новой вкладке, заменяя содержимое текущего окна (если оно представляет сплит)
" таким образом, исходное окно с ссылкой остаётся в фоне.
nnoremap <A-l> :tabedit <cfile><CR>

" -----------------------------------------------
" Функция для открытия файла из NERDTree в правом вертикальном сплите
" -----------------------------------------------
function! OpenInRightVsplitNERDTree()
  " Получаем выбранную ноду NERDTree
  let node = NERDTreeGetSelectedNode()
  if empty(node)
    return
  endif
  " Если нода является директорией, переключаем её (разворачиваем/сворачиваем)
  if node.isDirectory
    call node.toggle()
  else
    " Получаем путь к файлу из ноды
    if type(node.path) == type("")
      let file = node.path
    else
      let file = node.path.str()
    endif
    " Открываем файл в правом вертикальном сплите.
    " Команда "vertical rightbelow vsplit" создаёт новый сплит справа от текущего окна.
    execute 'vertical rightbelow vsplit ' . fnameescape(file)
  endif
endfunction

" -----------------------------------------------
" Привязка клавиши Alt+k в буфере NERDTree
" -----------------------------------------------
" Эта привязка активируется только в буфере с файловым деревом NERDTree.
autocmd FileType nerdtree nnoremap <buffer> <A-k> :call OpenInRightVsplitNERDTree()<CR>


nnoremap <C-x> :b#<CR>
nnoremap <C-k> :e <cfile><CR>

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

" Горячая клавиша для замены текста во всем файле (Ctrl+Shift+R)
nnoremap <M-r> :%s/\<<C-r><C-w>\>//g<Left><Left>

" Горячие клавиши для копирования в системный буфер
nnoremap <C-C> "+y
vnoremap <C-C> "+y                
imap <C-V> <C-R>+                   

" Горячие клавиши для NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>    " Открыть/закрыть NERDTree

" Перемещение строки вверх при нажатии Alt+Up
nnoremap <M-Up> :m .-2<CR>==

" Перемещение строки вниз при нажатии Alt+Down
nnoremap <M-Down> :m .+1<CR>==

" Перемещение выделенных строк вверх при нажатии Alt+Up в визуальном режиме
vnoremap <M-Up> :m '<-2<CR>gv=gv

" Перемещение выделенных строк вниз при нажатии Alt+Down в визуальном режиме
vnoremap <M-Down> :m '>+1<CR>gv=gv

