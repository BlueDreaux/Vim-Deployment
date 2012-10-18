" Vim compiler file
" Compiler:	Mimer ESQL Preprocessor 
" Maintainer:   Jeremiah Dey <jpd001@shsu.edu>
" URL:		n/a
" Last Change:  2006-Dec-13

let current_compiler = "esql"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif
lcd %:p:h
"%=file, :p=full path, :gs=globalsubstitue, ? are used since / and : are path characters.
" put the following on above line when done debugging->|call UploadMimer()
command! Commit  silent !svn commit %:p %:p:gs?eco?cbl?
command! Compdev call Compdev()
function! Compdev()
	silent make
	bot vsp %:p:gs?eco?cbl?
	silent make
endfunction

"CompilerSet shellpipe=>
CompilerSet makeef=./commandresults.txt 

CompilerSet makeprg=esql10\ --cobol\ --verify=entry\ %:p\ %:p:gs?eco?cbl?
CompilerSet errorformat=%f(%l):\ syntax\ %trror:\ %m,%f(%l):\ %trror:\ %m,%f(%l):\ %tarning:\ %m
