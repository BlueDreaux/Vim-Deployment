" Vim compiler file
" Compiler:	Oracle PCO Production Compile
" Maintainer:   Andrew Pilling <Drew.Pilling@SHSU.edu>
" URL:		n/a
" Last Change:  2008-Aug-18

" Note:	This is a copy of Jeremiah Dey's mimprod.vim and does the exact same
" thing. I wanted to have a seperate compile file, however, since we may need
" different compile options for the Oracle routines.

" Note: Added $ACUPATH to the makeprg line, this was necessary to force the use
" of the correct acucobol compiler if you have more than one installation -JPD


let current_compiler = "ccbl32"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

command! Makedev make -Li -Lf -S8 -Ga

"CompilerSet shellpipe=2>
CompilerSet makeef=./commandresults.txt 
CompilerSet makeprg=\"$ACUPATH\\ccbl32\"\ -o\ c:\\oracle\\object\\@.acu\ -v\ -x\ -Lo\ c:\\oracle\\list\\@.lst\ -St\ -Dci\ -D5\ -Dw32\ -Dz\ -Zl\ -Z50\ $*\ %
CompilerSet errorformat=%f\\,\ line\ %l:\ %m
"CompilerSet errorformat=%f(%l):\ syntax\ error:\ %m
