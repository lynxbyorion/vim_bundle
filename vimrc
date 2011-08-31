" Мой конфигурационный файл для Vim -- version 0.1.3

let g:snips_author = 'Gennady Sazonov'

set nocompatible            " Несовместимость с vi
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

"My bundles:
Bundle 'OmniCppComplete'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'cscope_plus.vim'
Bundle 'vcscommand.vim'
Bundle 'TaskList.vim'
Bundle 'snipMate'
Bundle 'fugitive.vim'

filetype plugin indent on

"Настройка буферов
set autowrite            " Записывать всё перед изменением
set hidden               " Не выгружать буфер когда переключаешься на другой 

"Подключение мыши
if has('mouse')
    set mouse=a
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Редактирование

" поведение строк
set scrolloff=6         " количество строк вокруг курсора
set number              " показывать номера строк
set wrap                " разрывать строки
set lbr                 " перенос по словам

"""""""""""""""""""""" Табуляция""""""""""""""""""""""""""""""""""""""""

set softtabstop=4
set shiftwidth=4        "табуляция авто отступов
set tabstop=4           "табуляция

set autoindent          " авто отступ
" set cindent             " Indentation in the style of C
set smarttab
set expandtab           " Вместо табуляции пробелы
set smartindent         " Включаем умные отступы (например после { )

" for makefile tabs
autocmd FileType make set noexpandtab tabstop=8 shiftwidth=8

" for tex
autocmd FileType tex set textwidth=78 foldmethod=marker tabstop=2 shiftwidth=2 softtabstop=2

" for html.erb
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html

" for cpp
autocmd FileType cpp set softtabstop=4 shiftwidth=4 tabstop=4

" for ruby
autocmd FileType ruby set softtabstop=2 shiftwidth=2 tabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" показывать выделения после сдвига
vnoremap < >gv
vnoremap > <gv

set showmatch           " Показывать совпадающую скобку

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" интерфейс

set backspace=2             " Influences of <BS> in Insert mode
set termencoding=utf-8      " Кодировка терминала
syntax on                   " Подсветка синтаксиса
set ruler                   " Строка статуса
set mousehide               " Скрывать курсор мыши когда печатаем

"настройка цветовой схемы
set t_Co=256                " поддержка 256 цветов в терминале ( необходимо TERM=xterm-256color)
colorscheme xoria256         " Неплохие схемы: calmar256-dark, peaksea, lucius, wombat256 

set winminheight=0          " Минимальная высота окна
set winminwidth=0           " Минимальная ширина окна
set laststatus=2            " Всегда показывать строку статуса
set wildmenu                " Более удобное дополнение
set wildmode=list:longest
set wildcharm=<Tab>
set showcmd                 " Показывать незавершённые команды в статусбаре
set autoread                " После изменения файл сам перечитывается

" Опции автодополнения - включаем только меню с доступеыми вариантами
set completeopt=menu

" задает формат строки статуса.
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" list mode: on. ( Show tabs as >--- and trail spaces as - )""
set list                                                    ""
set listchars=tab:>-,trail:-                                ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup                " Отключить бэкапы
set noswapfile              " Отключить свап файлы

set visualbell t_vb=        " Отключить пищалку
set splitbelow              " Новое окно появляется внизу

" вначале открывает в utf8, если не подходит то в cp1251
set fileencodings=utf8,cp1251,koi8-r
set encoding=utf8

set browsedir=current       " ????? TODO: I don't now!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""" Search settings"""""""""""""""""""""""""""""""""""
                                                                             ""
set ignorecase              " Case of normal letter is ignored               ""
set smartcase               " If search pattern contain upper -> noignorecase""
set incsearch               " Поиск по набору текста                         ""
set hlsearch                " Подсвечивать найденные элементы                ""
                                                                             ""
function! MyHlSearch()                                                       ""
    if &hlsearch == 0                                                        ""
        :set hlsearch                                                        ""
    else                                                                     ""
        :set nohlsearch                                                      ""
    endif                                                                    ""
endfunction                                                                  ""
                                                                             ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""" Folding""""""""""""""""""""""""""""""""""""""""""""""""
                                                                             ""
set foldenable              "                                                ""
set foldmethod=manual       "                                                ""
set foldcolumn=3            "                                                ""
set foldlevel=1             "                                                ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=~/.vim/tags/qt4tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" switch on/off spelling 
imap    <F3>    <Esc>:set spell!<CR>
nmap    <F3>    <Esc>:set spell!<CR>

" Очистить подсветку последнего найденного выражения
nmap    <S-F3> :call MyHlSearch()<CR>
imap    <S-F3> <Esc>:call MyHlSearch()<CR>
vmap    <S-F3> <Esc>:call MyHlSearch()<CR>gv

" F4 -- просмотр ошибок
nmap    <F4>    :copen<CR>
imap    <F4>    <esc>:copen<CR>
vmap    <F4>    <esc>:copen<CR>

" переход к следующей/предыдущей ошибке + развернуть fold + в центр экрана + сообщение об ошибке
map     <C-F4>  :cn<CR>zvzz:cc<CR>
map     <S-F4>  :cp<CR>zvzz:cc<CR>

" открыть BufExplorer ( просмоторщик буфера )
 nmap    <F5>  :BufExplorer<CR>
 imap    <F5>  <esc>:BufExplorer<CR>
 vmap    <F5>  <esc>:BufExplorer<CR>

" следующий буфер
 nmap    <S-F5>  :bn<CR>
 imap    <S-F5>  <esc>:bn<CR>i
 vmap    <S-F5>  <esc>:bn<CR>

" предыдущий буфер
 nmap    <C-F5>  :bp<CR>
 imap    <C-F5>  <esc>:bp<CR>i
 vmap    <C-F5>  <esc>:bp<CR>

" сохраняет все файлы и выполняет команду :make
 map     <F7>    :wall \| make<CR>
 map     <C-F7>  :wall \| make CFLAGS=-g<CR>

" f11 - обозреватель файлов (:Ex для стандартного обозревателя, плагин NERDTree -
" дерево каталогов)
map     <F11>   :NERDTreeToggle<cr>
vmap    <F11>   <esc>:NERDTreeToggle<cr>i
imap    <F11>   <esc>:NERDTreeToggle<cr>i

" выход из редактора по F12
map     <F12>   :q<CR>
imap    <F12>   <Esc>:q<CR>
cmap    <F12>   <Esc><Esc>:q<CR>

vnoremap    <C-X>   "+x " CTRL-X - вырезать
vnoremap    <C-C>   "+y " CTRL-C - копировать
imap        <C-V>   "+g " CTRL-V вставить под курсором

""""""""""""""""""""""""""""""""""""""""
"switching spelling
setlocal spell spelllang=en,ru

menu Spell.next ]s        " Move to next misspelled word 
menu Spell.back [s        " Like ']s' but search backwards
menu Spell.word_good zg   " Add word as a good word   
menu Spell.word_wrong zw  " Mark word as a wrong word 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" changing keyboard layout - <C-^>
set keymap=russian-jcukenwin
" keyboard default - english
set iminsert=0

" ange keyboard layout and display
function! MyKeyMapHighlight()
    if &iminsert == 0
        hi StatusLine ctermfg=11 guifg=Cyan
    else
        hi StatusLine ctermfg=150 guifg=#afdf87
    endif
endfunction

call MyKeyMapHighlight()
" changing the active window will be execute update
au WinEnter * :call MyKeyMapHighlight()

cmap <silent><C-F> <C-^>
imap <silent><C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent><C-F> <C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent><C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

" Перевод слов при помощи консольной версии StarDict -->
  function! TranslateWord()
      let s:dict    = "sdcv"
      let s:phrase  = expand("<cword>")
      let s:tmpfile = tempname()
      silent execute "!" . s:dict . " " . s:phrase . " > " . s:tmpfile
      let s:lines = system("wc -l " . s:tmpfile . "| awk '{print $1}'")
      if s:lines == 0
          echo s:phrase . ": Not found."
      else
          execute "botright sp " . s:tmpfile
      end
  endfunction

   map <F8> :call TranslateWord()<CR>
   menu Translate.Translate_word<Tab><F8> :call TranslateWord()<CR>
" Перевод слов при помощи консольной версии StarDict <--

if ('gui')
    source $MYGVIMRC
endif

