let g:list_python_initialized = 0
let s:list_plugin_dir = expand('<sfile>:p:h')
function! InitializeListPython()
  if ! g:list_python_initialized
    exe 'pyfile' . s:list_plugin_dir . '/list_vim.py'
    let g:list_python_initialized = 1
  endif
endfunction

function! s:CreateTempBuffer()
  edit temporary_buffer
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  1
endfunction

function! RunCmd(name)
  call InitializeListPython()
  exe 'python RunCmd(' . '(vim.eval("a:name")))'
endfunction

function! RunCmdAutoOpen(name)
  call InitializeListPython()
  exe 'python RunCmd(' . '(vim.eval("a:name")), True)'
endfunction

fun! RunCmdWithHistory(c)
  call histadd("cmd", "RunCmd " . a:c)
  call RunCmd(a:c)
endfun
