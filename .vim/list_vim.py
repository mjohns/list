# Copyright 2012 Google Inc. All Rights Reserved.

__author__ = 'mjohns@google.com (Michael Johns)'

import vim
import commands

def escapeStar(str):
  str_list = []
  for c in str:
    if c is '*':
      str_list.append("\*")
    else:
      str_list.append(c)

  return ''.join(str_list)

def FindFiles(name):
  escapedName = escapeStar(name + "*")
  s,output=commands.getstatusoutput('find . -iname ' + escapedName +
    ' | grep -v \.swp | grep -v \.swo')
  files=output.split('\n')
  ListFiles(files, True)

def RunCmd(name):
  s,output=commands.getstatusoutput(name)
  files=output.split('\n')
  ListFiles(files, False)

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
    vim.command('map <buffer> <Enter> gf')
    vim.command('map <buffer> q <C-^>')
    vim.command('map <buffer> :q q')
    vim.current.buffer[:] = files
    vim.command('setlocal nomodifiable')
    vim.command('0')
