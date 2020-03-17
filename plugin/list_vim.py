import vim
import subprocess
import uuid


def RunCmd(name, autoOpen = False):
  s,output=subprocess.getstatusoutput(name)
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
    vim.command('edit temporary_buffer_' + uuid.uuid4().hex)
    vim.command('setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap');
    vim.command('1')

    vim.command('map <buffer> <Enter> gF')
    vim.command('map <buffer> q <C-^>')
    vim.command('map <buffer> :q q')
    vim.current.buffer[:] = lines
    vim.command('0')
