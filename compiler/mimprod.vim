" Vim compiler file
" Compiler:	Acucobol GT (ANSI Format)	
" Maintainer:   Jeremiah Dey <jpd001@shsu.edu>
" URL:		n/a
" Last Change:  2006-Dec-13

" NOTE: This is my first attempt at making a compiler pluging suitable for acucobol programs. 
"       As I've never scripted VIM before, don't laugh.

let current_compiler = "ccbl32"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

command! Makedev make -Li -Lf -S8 -Ga

"CompilerSet shellpipe=2>
CompilerSet makeef=./commandresults.txt 
CompilerSet makeprg=\"$ACUPATH\\ccbl32\"\ -o\ c:\\mimer\\object\\@.acu\ -v\ -x\ -Lo\ c:\\mimer\\list\\@.lst\ -Sa\ -Dci\ -D5\ -Dw32\ -Dz\ -Zl\ -Z50\ $*\ %
CompilerSet errorformat=%f\\,\ line\ %l:\ %m
