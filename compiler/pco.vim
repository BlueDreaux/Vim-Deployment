" Vim compiler file
" Compiler:	Oracle PCO Preprocessor 
" Maintainer:   Andrew Pilling <Drew.Pilling@SHSU.edu>
" URL:		n/a
" Last Change:  2008-Aug-18
" Preprocesses a */pco/*.pco outputing */cbl/*.cbl

" Requirements: 
" $PATH should find procob, otherwise you have to add the PATH explicitly to makeprg

let current_compiler = "procob"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

"%=file, :p=full path, :gs=globalsubstitue, ? are used since / and : are path characters.
command! Compile call Compile()
function! Compile()
	%s:declare\s\+\(\S*\)\s\+cursor\s\+\zsfor\ze:with hold for:		
	silent make
	bot vsp %:p:branch??:gs?pco?cbl?
	silent make
endfunction

command! Commit  silent !svn commit %:p %:p:gs?branch??:gs?pco?cbl?

command! Compdev call Compdev()
function! Compdev()
    lcd %:p:h
	silent make
	bot vsp %:p:gs?branch??:gs?pco?cbl?
	Makedev
"    lcd -
"	silent call UploadOracle()
endfunction

function! MakeTestIO()
"	Make base changes and write the test io routines.		
	%s:\<\zs\(\S\+\)\zedbio\>:\1Oracle:g
	%s:declare\s\+\(\S*\)\s\+cursor\s\+\zsfor\ze:with hold for:		
	g:sp2db_oracle\.cpy:d
	g:sp2shsudb_oracle\.cpy:d
	%s:iodb01_oracle\.cpy:iodb01_oracle_debg.cpy:
	%s:iodb03_oracle\.cpy:iodb03_oracle_debg.cpy:
	%s:\s\+if\s\+external_gui\s\+=.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n::
	%s:end-if\n\s\+goback:goback:
	"%s:\<io_name\>\s\+.*value "\zs\(\S\+\)\ze":\1Oracle:g
	w! %:p:gs?\(\S\+\)dbio\.?\1Oracledbio.?
	u
"	Open the test routines, run procob on the .pco's, then make the .cbl's.
	bot vsp %:p:gs?\(\S\+\)dbio\.?\1Oracledbio.?
	Compdev
	silent call UploadOracle()
endfunction

"CompilerSet shellpipe=>
CompilerSet makeef=./commandresults.txt 
CompilerSet makeprg=procob\ %\ oname=%:p:gs?branch??:gs?pco?cbl?\ define=DEV
CompilerSet errorformat=%C\ %.%#,%C.%#%.,%EError\ at\ line\ %l\\,\ column\ %c\ in\ file\ %f,%C%m,%ZPCB%m,%+GPCB-%.-%.%#:%m
