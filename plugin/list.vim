let g:list_python_initialized = 0
let s:list_plugin_dir = expand('<sfile>:p:h')
function! InitializeListPython()
  if ! g:list_python_initialized
    if has('python3')
      exe 'py3file' . s:list_plugin_dir . '/list_vim3.py'
    else
      exe 'pyfile' . s:list_plugin_dir . '/list_vim.py'
    endif
    let g:list_python_initialized = 1
  endif
endfunction

function! RunCmd(name)
  call InitializeListPython()
  if has('python3')
    exe 'python3 RunCmd(' . '(vim.eval("a:name")))'
  else
    exe 'python RunCmd(' . '(vim.eval("a:name")))'
  endif
endfunction

function! RunCmdAutoOpen(name)
  call InitializeListPython()
  if has('python3')
    exe 'python3 RunCmd(' . '(vim.eval("a:name")), True)'
  else
    exe 'python RunCmd(' . '(vim.eval("a:name")), True)'
  endif
endfunction

fun! RunCmdWithHistory(c)
  call histadd("cmd", "RunCmd " . a:c)
  call RunCmd(a:c)
endfun
