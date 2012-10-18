" Vim filetype plugin file
" Language:    Powerpro Script language
" Maintainer:  Whoever wants to!
" Last Change: Sun 4/27/2003
" Version:     0.02

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

"Powerpro Local settings
setlocal iskeyword+=*,.
setlocal comments=:;
setlocal formatoptions-=t formatoptions+=rol

"Set the file browser to filter both *.powerpro and *.txt files.
if has("gui_win32") && !exists("b:browsefilter")
  let b:browsefilter = "All Files (*.*)\t*.*\nPowerPro Script Files (*.powerpro, *.txt)\t*.powerpro;*.txt\n"
endif
