import vim
import commands


def RunCmd(name, autoOpen = False):
  s,output=commands.getstatusoutput(name)
  files=output.split('\n')
  ListFiles(files, autoOpen)


def ListFiles(files, autoOpen):
  if len(files) == 0 or (len(files)==1 and files[0] == ""):
    vim.command('echohl ErrorMsg')
    vim.command('echomsg "No files found"')
    vim.command('echohl None')
  elif len(files) == 1 and autoOpen:
    vim.command('e ' + files[0])
  else:
    vim.command('call s:CreateTempBuffer()')
    vim.command('setlocal modifiable')
    vim.command('map <buffer> <Enter> gF')
    vim.command('map <buffer> q <C-^>')
    vim.command('map <buffer> :q q')
    vim.current.buffer[:] = files
    vim.command('setlocal nomodifiable')
    vim.command('0')
