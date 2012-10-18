" Vim compiler file
" Compiler:	Acucobol GT	
" Maintainer:   Jeremiah Dey <jpd001@shsu.edu>
" URL:		n/a
" Last Change:  2006-Dec-13

" NOTE: This is my first attempt at making a compiler plugin suitable for acucobol programs. 
"       As I've never scripted VIM before, don't laugh.

let current_compiler = "ccbl32"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif


command! Makedev silent make -Li -Lf -S8 -Ga 
command! Commit silent !svn commit %:p

"CompilerSet shellpipe=2>
CompilerSet makeef=./commandresults.txt 

CompilerSet makeprg=\"$ACUPATH\\ccbl32\"\ -o\ c:\\shsutest\\object\\@.acu\ -v\ -x\ -Lwsc\ -Ll\ 0\ -Lo\ c:\\shsutest\\list\\@.lst\ -St\ -Dci\ -D5\ -Dw32\ -Dz\ -Zl\ -Z50\ $*\ %:p
CompilerSet errorformat=%f\\,\ line\ %l:\ %m
