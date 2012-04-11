let g:list_python_initialized = 0
function! InitializeListPython()
  if ! g:list_python_initialized
    exe 'pyfile /home/mjohns/.vim/list_vim.py'
    let g:list_python_initialized = 1
  endif
endfunction

function! s:CreateTempBuffer()
  edit temporary_buffer
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  1
endfunction

function! MyFind(name)
  call InitializeListPython()
  exe 'python FindFiles(' . '(vim.eval("a:name")))'
endfunction

function! RunCmd(name)
  call InitializeListPython()
  exe 'python RunCmd(' . '(vim.eval("a:name")))'
endfunction
