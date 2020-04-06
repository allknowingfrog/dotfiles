set nohlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab
set showmode
set autoindent
set smartindent
set lazyredraw
set scrolloff=10
set ruler

"skip smartindent in python files
"au! FileType python setl nosmartindent

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235

filetype plugin on
filetype indent on

syn sync fromstart

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"default split behavior is odd
set splitbelow
set splitright

"fix inconsistent Y behavior
nnoremap Y y$

"map ; to ;;
nnoremap ;; ;

"open and return to normal
nnoremap ;o o<ESC>

"push 0 register (last yank)
nnoremap ;0 "0p

"remove trailing whitespace
command TWS %s/\s\+$//

"buffer shortcuts
nnoremap ;p :bp<ESC>
nnoremap ;n :bn<ESC>
nnoremap ;b :buffers<ESC>

"window shortcuts
nnoremap ;v <C-w>v
nnoremap ;s <C-w>s
nnoremap ;w <C-w>w
nnoremap ;W <C-w>W
nnoremap ;h <C-w>h
nnoremap ;l <C-w>l
nnoremap ;k <C-w>k
nnoremap ;j <C-w>j
nnoremap ;q <C-w>q
nnoremap ;> <C-w>>
nnoremap ;< <C-w><
nnoremap ;+ <C-w>+
nnoremap ;- <C-w>-
nnoremap ;= <C-w>=
