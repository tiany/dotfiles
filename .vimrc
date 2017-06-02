filetype off

call pathogen#infect()
call pathogen#helptags()

set foldmethod=indent
set foldlevel=99

set nocp
set bs=2
set wildmenu
set incsearch
set ignorecase
set smartcase
set hlsearch
set nu
set ruler
set sts=4
set expandtab
set shiftwidth=4
set mouse=a
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set laststatus=2

set colorcolumn=80


"special settings
filetype on
syntax on
filetype indent plugin on
colorscheme torte

highlight ColorColumn ctermbg=DarkGray guibg=DarkGray
"move by visual line
nnoremap j gj
nnoremap k gk

imap jj <ESC>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" :w!! 
" write the file when you accidentally opened it without the right (root) privileges
cmap w!! w !sudo tee % > /dev/null

map <F3> :TlistToggle<cr>
map <F4> :NERDTreeToggle<cr>
"map <F5> :w<cr>:!g++ -g % -o %<.o<cr>
"if $PWD =~ '.*L1809.*'
    "set tags+=~/L1809_1.3.00_20111124/tags
    "let g:LookupFile_TagExpr = '"./filenametags"'
    "set path+=/home/wangmeng/L1809/frameworks/base/include
    "set makeprg=source\ ~/L1809_1.3.00/build/envsetup.sh;mm
"else
    "set makeprg=g++\ -g\ %\ -o\ %<.o
    ""set makeprg=make\ %:r.o
"endif
"map <F5> :w<cr>:make<cr><cr>
"else
    "map <F5> :w<cr>:!g++ -g % -o %<.o<cr>
"endif

"map <F6> :!./%<.o<cr>
"map <F7> :!gdb ./%<.o<cr>
map <F9> <ESC>i#include <iostream><cr><cr>using namespace std;<cr>
              \int main (int argc, char** argv)<cr>{<cr>return 0;<cr>}<cr><ESC>kkO

let mapleader = ","
map  <Leader><Space> :nohls<cr>
nmap <Leader>tn :tabnext<cr>
nmap <Leader>tp :tabprevious<cr>
map  <Leader>ee :sp $MYVIMRC<cr>
map  <Leader>ss :source $MYVIMRC<cr>
map  <Leader>qq  :q!<cr>
map  <Leader>wq  :wq<cr>
"map  <Leader>da !!date<cr>
"imap  <F2> <C-r>=strftime("%Y-%m-%d")<cr>
"map for comment when modify src
abbr wma //================== Add by wang meng  [<C-r>=strftime("%Y-%m-%d %H:%M")<cr>]  ==================<cr>Begin<cr>End<ESC>O<BS><BS>
abbr wmb //================== Add by wang meng Begin [<C-r>=strftime("%Y-%m-%d %H:%M")<cr>]  ==================<cr>End<ESC>O<ESC>^c$<ESC>^i
abbr wmc //================== Commented by wang meng Begin  [<C-r>=strftime("%Y-%m-%d %H:%M")<cr>]  ==================<cr>End<ESC>
iab  xda <C-r>=strftime("%Y-%m-%d")<cr>

autocmd! bufwritepost .vimrc source $MYVIMRC

"search the selected ones
vnoremap <silent> <Leader>/ y/<C-R>=escape(@",'\\/.*$^~[]')<cr>
vnoremap <silent> <Leader>? y?<C-R>=escape(@",'\\/.*$^~[]')<cr><cr>

"Substitute for selected ones
vnoremap <silent> <Leader>s y:s/<C-R>=escape(@",'\\/.*$^~[]')<cr>/

"for compile
"set makeprg=make\ %:r.o

"export this just for the server enviroment is strange
lang C


map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<Leader>8'
"au FileType python 
set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt=menuone,longest,preview
map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<cr>
map <F7> :!gdb ./%<.o<cr>
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20

" buffers
nmap <Leader>bn :bnext<cr>
nmap <Leader>bp :bprevious<cr>
set hidden

" undo
nnoremap <F5> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir=~/.vim_undodir/
    set undofile
endif
"if has("backup")
set backupdir=~/.vim_backdir/
set backup
"endif
"

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
map  <Leader>lc  :lclose<cr>
map  <Leader>lo  :lopen<cr>

"macro
let @a="^yawi(>>f=hi, 'pi'),ld$j"
let @b="^i'lf=hi': ALL,ld$j"
let @c="^i'lf=hi': ALL_WITH_RELATIONS,ld$j"
let @d="^f:i,ld$j"

" NERDComment
let NERDSpaceDelims=1
