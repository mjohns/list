import vim
import commands


def RunCmd(name, autoOpen = False):
  s,output=commands.getstatusoutput(name)
  lines=output.split('\n')
  ListOutput(lines, autoOpen)


def ListOutput(lines, autoOpen):
  if len(lines) == 0 or (len(lines)==1 and lines[0] == ""):
    vim.command('echohl ErrorMsg')
    vim.command('echomsg "No output"')
    vim.command('echohl None')
  elif len(lines) == 1 and autoOpen:
    vim.command('e ' + lines[0])
  else:
    vim.command('call s:CreateTempBuffer()')
    vim.command('setlocal modifiable')
    vim.command('map <buffer> <Enter> gF')
    vim.command('map <buffer> q <C-^>')
    vim.command('map <buffer> :q q')
    vim.current.buffer[:] = lines
    vim.command('setlocal nomodifiable')
    vim.command('0')
