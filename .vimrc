syntax enable

source /usr/share/vim/google/google.vim
source /home/build/nonconf/google3/tools/tags/gtags.vim
nmap sf  :exe 'let searchtag= "' . expand('<cword>') . '"' \| :exe 'let @/= "' . searchtag . '"'<CR> \| :exe 'Gtlist ' . searchtag <CR>

set expandtab
set shiftwidth=2
set softtabstop=2
set incsearch
set hlsearch
set number
set smartcase
set scrolloff=6
set wildmode=longest:full
set wildmenu
set ic

set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%t\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

let g:SuperTabDefaultCompletionType = "context"
let g:EclimJavaSrcValidate = 1
let g:EclimJavaSearchSingleResult = "edit"

let mapleader=","
map <leader>b :FufBuffer<CR>
map <leader>t :FufTaggedFile<CR>
map <leader>i :JavaImport<CR>
map <leader>v :Validate<CR>
map <leader>c :cnext<CR>
map <leader>C :cprevious<CR>
map <leader>l :lnext<CR>
map <leader>L :lprevious<CR>
map <leader>m ciwthis.<esc>pa = <esc>pa;<esc>

"map <leader>s :JavaSearch<CR>

map gl $
map gh ^
map s z
map s z
map ss g;
map sa g,
map sd *
map sD :%s///gn<CR>
map sc "*y
map sp "*p
map sk [{
map sj ]}
map sb <C-^>
noremap x "_x
let &t_Co=256
map <tab> =
vmap J j
vmap K k
map <C-k> <C-w>w
autocmd BufNewFile,BufRead *.gxp set filetype=xml
autocmd FileType java imap <tab> <C-f>
" prevent auto line wrapping that comes from google.vim
autocmd BufNewFile,BufRead * set tw=2000

if has('mouse')
  set mouse=a
endif

colorscheme inkpot

fun! Local()
  lcd %:p:h
endfun

fun! StripWhite()
  %s/[ \t]\+$//ge
  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfun
map <leader>s :call StripWhite()

highlight ExtraWhitespace ctermbg=yellow guibg=yellow
au ColorScheme * highlight ExtraWhitespace guibg=yellow
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

source /home/mjohns/.vim/list.vim
command! -nargs=1 Find :call MyFind("<args>")
nmap <leader>f :Find 
nmap <leader>g :call MyFind(expand("<cword>"))<CR>
command! -nargs=1 RunCmd :call RunCmd("<args>")
nmap <leader>r :RunCmd 
nmap <leader>a :call RunCmd("all " . expand("<cword>"))<CR>

nmap gk dd/=======<CR>V/>>>>>>><CR>d/<<<<<<<<CR>
nmap gj V/=======<CR>d/>>>>>>>><CR>dd/<<<<<<<<CR>

" C-indenting options for java:
" " j1: Set java-indenting
" " +2s: Indenting a continuing line by 2 * shiftwidth
" " l1: Align brackets with the case label
autocmd BufNewFile,BufRead *.java set cino=j1,+2s,l1

" Outline Window
source /google/src/head/depot/eng/vim/runtime/outline_window.vim
nnoremap ,o :call OutlineWindow()<CR>
autocmd BufNewFile,BufRead * hi StatusLine ctermfg=Cyan

" Hide cerating files in Explore
let g:netrw_list_hide= '.*\.swp$,.*\.swo$'

" :messages to debug startup
