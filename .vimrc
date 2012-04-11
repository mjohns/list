syntax on

source /usr/share/vim/google/google.vim
source /home/build/nonconf/google3/tools/tags/gtags.vim
nmap sf  :exe 'let searchtag= "' . expand('<cword>') . '"' \| :exe 'let @/= "' . searchtag . '"'<CR> \| :exe 'Gtlist ' . searchtag <CR>

set expandtab
set shiftwidth=2
set softtabstop=2
set incsearch
set hlsearch
set number
set ic
set smartcase
set scrolloff=6
set wildmode=longest:full
set wildmenu

set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

let g:SuperTabDefaultCompletionType = "context"
let g:EclimJavaSrcValidate = 0

let mapleader=","
map <leader>b :FufBuffer<CR>
map <leader>t :FufTaggedFile<CR>
map <leader>i :JavaImport<CR>
map <leader>s :JavaSearch<CR>

map gl $
map gh ^
map s z
map s z
map ss g;
map sa g,
map sd *
map sc "*y
map sp "*p
map sj 20j
map sk 20k
noremap x "_x
let &t_Co=256
map <tab> =

autocmd BufNewFile,BufRead *.gxp set filetype=xml
autocmd FileType java imap <tab> <C-f>

if has('mouse')
  set mouse=a
endif

colorscheme inkpot

fun! Local()
  lcd %:p:h
endfun
autocmd BufNewFile,BufRead * set cino=J0

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
command! -nargs=1 RunCmd :call RunCmd("<args>")
nmap <leader>r :RunCmd 


