set nohlsearch
set incsearch
set ts=4
set shiftwidth=4
set expandtab
set showmode
set autoindent
set smartindent
set lazyredraw
set scrolloff=10

syn sync fromstart

"pathogen
execute pathogen#infect('~/dotfiles/bundle/{}')
syntax on
filetype plugin indent on
let b:match_ignorecase=1 "matchit.vim ignores case

"fugitive
set diffopt+=vertical

"comment out line containing given string
"i.e. ':CO example' comments out lines containing 'example'
function CommentOut(string)
    exe '%s/.*\(\/\)\@<!' . a:string . '.*/\/\/&/gc'
endfunction

command -nargs=1 CO call CommentOut(<q-args>)

"remove given string
"i.e. ':Remove example' deletes all instances of 'example'
function Remove(string)
    exe '%s/' . a:string . '//gc'
endfunction

command -nargs=1 Remove call Remove(<q-args>)

"search on contents of yank register, replace with given string
"i.e. ':Remove example' deletes all instances of 'example'
function YankRep(string)
    exe '%s/command/' . a:string . '/gc'
endfunction

command -nargs=1 YankRep call YankRep(<q-args>)

"convert dos linebreaks to unix
command DosToUnix update | e ++ff=dos | setlocal ff=unix | w

"remove trailing whitespace
command TWS %s/\s\+$//

"return from insert mode to normal
inoremap ii <ESC>

"open and return to normal
nnoremap ;o o<ESC>

"push 0 register (last yank)
nnoremap ;p "0p

"new print statement
nnoremap ;np oprint("");<ESC>hhi

"new sql statement
nnoremap ;ns o$sql .= "";<ESC>hi

"comment out current line
nnoremap ;c :,s/[A-Za-z]/\/\/&<cr> 

"find task
nnoremap ;t /\$task == ['"]

"new script
nnoremap ;nj i?><cr><SCRIPT type='text/javascript'><cr><cr></SCRIPT><cr><?<ESC>kki

"wrap line in print statement
nnoremap ;wp :s/\([^ ][^;]*\)/print("\1");<cr>

"split sql/print/etc
function SplitString()
    let col = getpos('.')
    let pos = col[2] + 1
    let line = getline('.')
    if match(line, 'print(') > -1
        execute ':s/\(\(^\s*\).*\)\%<'.pos.'c/\1");\r\2print("/'
    else
        execute ':s/\(\(^\s*\$\w\+\).*\)\%<'.pos.'c/\1";\r\2 .= "/'
    endif
endfunction

nnoremap ;s :call SplitString()<cr>

"join sql/print/etc
nnoremap ;j JF"df"
