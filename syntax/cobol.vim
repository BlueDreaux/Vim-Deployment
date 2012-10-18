" Vim syntax file
" Language: COBOL
" Maintainers:  Davyd Ondrejko <vondraco@columbus.rr.com>
"     (formerly Sitaram Chamarty <sitaram@diac.com> and
"		    James Mitchell <james_mitchell@acm.org>)
" Last change:  2001 Sep 02

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" MOST important - else most of the keywords wont work!
if version < 600
  set isk=@,48-57,-,_
else
  setlocal isk=@,48-57,-,_
endif

"This will expand the search range of your ctrl+p autofills. 
"Use ctrl+c to break out of the search early.
set include=^\\s*\\(copy\\|call\\)\\s*['\\"]\\=

syn case ignore

syn match cobolKeys "" contains=cobolReserved
syn keyword cobolReserved contained ACCEPT ACCESS ADD ADDRESS ADVANCING AFTER ALPHABET ALPHABETIC
syn keyword cobolReserved contained ALPHABETIC-LOWER ALPHABETIC-UPPER ALPHANUMERIC ALPHANUMERIC-EDITED ALS
syn keyword cobolReserved contained ALTERNATE AND ANY ARE AREA AREAS ASCENDING ASSIGN AT AUTHOR BEFORE BINARY
syn keyword cobolReserved contained BLANK BLOCK BOTTOM BY CANCEL CBLL CD CF CH CHARACTER CHARACTERS CLASS
syn keyword cobolReserved contained CLOCK-UNITS CLOSE COBOL CODE CODE-SET COLLATING COLUMN COMMA COMMON
syn keyword cobolReserved contained COMMUNICATIONS COMPUTATIONAL COMPUTE CONFIGURATION CONTENT CONTINUE
syn keyword cobolReserved contained CONTROL CONVERTING CORR CORRESPONDING COUNT CURRENCY DATA DATE DATE-COMPILED
syn keyword cobolReserved contained DATE-WRITTEN DAY DAY-OF-WEEK DE DEBUG-CONTENTS DEBUG-ITEM DEBUG-LINE
syn keyword cobolReserved contained DEBUG-NAME DEBUG-SUB-1 DEBUG-SUB-2 DEBUG-SUB-3 DEBUGGING DECIMAL-POINT
syn keyword cobolReserved contained DELARATIVES DELETE DELIMITED DELIMITER DEPENDING DESCENDING DESTINATION
syn keyword cobolReserved contained DETAIL DISABLE DISPLAY DIVIDE DIVISION DOWN DUPLICATES DYNAMIC EGI ELSE EMI
syn keyword cobolReserved contained ENABLE END-ADD END-COMPUTE END-DELETE END-DIVIDE END-EVALUATE END-IF
syn keyword cobolReserved contained END-MULTIPLY END-OF-PAGE END-PERFORM END-READ END-RECEIVE END-RETURN
syn keyword cobolReserved contained END-REWRITE END-SEARCH END-START END-STRING END-SUBTRACT END-UNSTRING
syn keyword cobolReserved contained END-WRITE ENVIRONMENT EQUAL ERROR ESI EVALUATE EVERY EXCEPTION EXIT
syn keyword cobolReserved contained EXTEND EXTERNAL FALSE FD FILE FILE-CONTROL FILLER FINAL FIRST FOOTING FOR FROM
syn keyword cobolReserved contained GENERATE GIVING GLOBAL GREATER GROUP HEADING HIGH-VALUE HIGH-VALUES I-O
syn keyword cobolReserved contained I-O-CONTROL IDENTIFICATION IN INDEX INDEXED INDICATE INITIAL INITIALIZE
syn keyword cobolReserved contained INITIATE INPUT INPUT-OUTPUT INSPECT INSTALLATION INTO IS JUST
syn keyword cobolReserved contained JUSTIFIED KEY LABEL LAST LEADING LEFT LENGTH LOCK MEMORY
syn keyword cobolReserved contained MERGE MESSAGE MODE MODULES MOVE MULTIPLE MULTIPLY NATIVE NEGATIVE NEXT NO NOT
syn keyword cobolReserved contained NUMBER NUMERIC NUMERIC-EDITED OBJECT-COMPUTER OCCURS OF OFF OMITTED ON OPEN
syn keyword cobolReserved contained OPTIONAL OR ORDER ORGANIZATION OTHER OUTPUT OVERFLOW PACKED-DECIMAL PADDING
syn keyword cobolReserved contained PAGE PAGE-COUNTER PERFORM PF PH PIC PICTURE PLUS POINTER POSITION POSITIVE
syn keyword cobolReserved contained PRINTING PROCEDURE PROCEDURES PROCEDD PROGRAM PROGRAM-ID PURGE QUEUE QUOTES
syn keyword cobolReserved contained RANDOM RD READ RECEIVE RECORD RECORDS REDEFINES REEL REFERENCE REFERENCES
syn keyword cobolReserved contained RELATIVE RELEASE REMAINDER REMOVAL REPLACE REPLACING REPORT REPORTING
syn keyword cobolReserved contained REPORTS RERUN RESERVE RESET RETURN RETURNING REVERSED REWIND REWRITE RF RH
syn keyword cobolReserved contained RIGHT ROUNDED RUN SAME SD SEARCH SECTION SECURITY SEGMENT SEGMENT-LIMITED
syn keyword cobolReserved contained SELECT SEND SENTENCE SEPARATE SEQUENCE SEQUENTIAL SET SIGN SIZE SORT
syn keyword cobolReserved contained SORT-MERGE SOURCE SOURCE-COMPUTER SPECIAL-NAMES STANDARD
syn keyword cobolReserved contained STANDARD-1 STANDARD-2 START STATUS STOP STRING SUB-QUEUE-1 SUB-QUEUE-2
syn keyword cobolReserved contained SUB-QUEUE-3 SUBTRACT SUM SUPPRESS SYMBOLIC SYNC SYNCHRONIZED TABLE TALLYING
syn keyword cobolReserved contained TAPE TERMINAL TERMINATE TEST TEXT THAN THEN THROUGH THRU TIME TIMES TO TOP
syn keyword cobolReserved contained TRAILING TRUE TYPE UNIT UNSTRING UNTIL UP UPON USAGE USE USING VALUE VALUES
syn keyword cobolReserved contained VARYING WHEN WHERE WITH WORDS WORKING-STORAGE WRITE
syn match	cobolReserved contained "\(=\|>\|<\|)\|(\|+\|\s-\s\)"
syn match   cobolreserved contained "\<contains\>"
syn match   cobolreserved contained "\<\(if\|invalid\|end\|eop\)\>"
syn match   cobolreserved contained "\<all\>"

syn keyword cobolConstant SPACE SPACES NULL ZERO ZEROES ZEROS LOW-VALUE LOW-VALUES

" syn match   cobolMarker       "^.\{6\}"
"syn match   cobolBadLine      "^.\{6\}[^ D\-*$/].*"hs=s+6

" If comment mark somehow gets into column past Column 7.
"syn match   cobolBadLine      "^\s*\*.*"

syn match   cobolNumber       "\<-\=\d*\.\=\d\+\>" contains=cobolPic
syn match   cobolPic		"\<s*9\+\>" contains=cobolPic
syn match   cobolPic		"\<$*\.\=9\+\>" contains=cobolPic
syn match   cobolPic		"\<Z*\.\=9\+\>" contains=cobolPic
syn match   cobolPic		"\<v9\+\>" contains=cobolPic
syn match   cobolPic		"\<s*9\+v9*s*\>" contains=cobolPic
syn match   cobolPic		"\<-\+[z9]\+\>" contains=cobolPic
syn match	cobolTodo		"\(debugging\|debug\|todo\)" contained
syn match   cobolComment      "^\s*\*.*" contains=cobolTodo
syn match	cobolComment	"|.*" contains=cobolTodo
"syn match   cobolComment      "^.\{6\}/.*"hs=s+6 contains=cobolTodo
"syn match   cobolComment      "^.\{6\}C.*"hs=s+6 contains=cobolTodo
syn match   cobolCompiler     "^.\{6\}$.*"hs=s+6

" For MicroFocus or other inline comments, include this line.
" syn region  cobolComment      start="*>" end="$" contains=cobolTodo

syn keyword cobolGoTo		GO GOTO
syn keyword cobolCopy		COPY

" cobolBAD: things that are BAD NEWS!
syn keyword cobolBAD		ALTER ENTER RENAMES

" cobolWatch: things that are important when trying to understand a program
syn keyword cobolWatch		OCCURS DEPENDING VARYING BINARY COMP REDEFINES
syn keyword cobolWatch		REPLACING RUN
syn match   cobolWatch		"comp-[123456xn]"

syn keyword cobolEXECs		EXEC END-EXEC


syn match   cobolDecl		"^\s\+\(0\=1\|77\|78\)\s" 
syn match   cobolDecl		"^\s\+[1-4]\d\s"
syn match   cobolDecl		"^\s\+0\=[2-9]\s"
syn match   cobolDecl		"^\s\+66 "
syn match	cobolDecl		"\(\.\|:\)"

syn match   cobolWatch		"^\s\+88\s"

syn match   cobolBadID		"\k\+-\($\|[^-a-z0-9]\)"

syn keyword cobolCALLs		CALL CANCEL GOBACK PERFORM INVOKE
syn match   cobolCALLs		"\(exit \+program\|,\)"
syn match   cobolExtras       /\<value \+\d\+\./

syn match   cobolString       /"[^"]*\("\|$\)/
syn match   cobolString       /'[^']*\('\|$\)/

syn match cobolSect /\zs\s\{2,}\ze.*\ssection\>/
syn match cobolSect /.\ssection\s*\.\zs\s\+\ze/ 

syn region  cobolLine         start="^." end="$" contains=ALL
syn region	cobolIf	      start="^\s*if\>" end="^\s*[^*]\(.*\.\s*$\|end-if\>\)" contains=ALLBUT,colbolSection fold keepend extend
syn region	cobolWhen		start="^\s*when\>" end="\(^\s*[^*].*\.\s*$\|\zs.*\ze\n\s*\(when\|end-evaluate\|end-search\)\>\)" contains=ALLBUT,cobolSection fold keepend extend
syn region	cobolSearch		start="^\s*search\s\+\S\+\>" end="^\s*[^*]\(.*\.\s*$\|end-search\>\)" contains=ALLBUT,cobolSection fold keepend extend
syn region  cobolPerform	start="^\s*perform\>.*\<until\>" end="^\s*[^*]\(.*\.\s*$\|end-perform\>\)" contains=ALLBUT,colbolSection fold keepend extend
syn region	cobolEvaluate	start="^\s*evaluate\>" end="^\s*[^*]\(.*\.\s*$\|end-evaluate\>\)" contains=ALLBUT,colbolSection fold keepend extend
syn region	cobolRead		start="^\s*read\>" end="^\s*[^*]\(.*\.\s*$\|end-read\>\)" contains=ALLBUT,colbolSection fold keepend extend
syn region	cobolCommentBlock	start="^\*\{2}$"  end="^\*\{2}$" contains=ALLBUT,cobolSection fold keepend
syn region  embededSQL        start="^\s*exec\s\+sql\>" end="\<end-exec\>" contains=ALLBUT,cobolSection fold keepend
syn region  cobolStringBlock  start="^\s*string\>" end="\(.*\<end-string\>\|^\s*[^*]\(.*\.\s*$\|.*\<end-string\>\)\)" contains=ALLBUT,cobolIf,cobolWhen,cobolPerform,cobolEvaluate,cobolRead,cobolCommentBlock,cobolSection fold keepend
syn region	cobolSection	start="^\s*\S\+\s\+section\>" end="^.*\<\(exit\(\s\+\<program\>\)*\|end\|^\s*procedure\>\|^\s*\S\+\s\+section\>\)\s*\." contains=ALL fold keepend

if exists("cobol_legacy_code")
    syn region  cobolcondflow     contains=allbut,cobolline start="\<\(if\|invalid\|end\|eop\)\>" skip=/\('\|"\)[^"]\{-}\("\|'\|$\)/ end="\." keepend
endif

"if ! exists("cobol_legacy_code")
    " catch junk in columns 1-6 for modern code
    " catch junk in columns 1-6 for modern code
"    syn match cobolBAD      "^ \{0,5\}[^ ].*"
"endif

" many legacy sources have junk in columns 1-6: must be before others
" Stuff after column 72 is in error - must be after all other "match" entries
" if exists("cobol_legacy_code")
"   syn match   cobolBadLine      "^.\{6}[^*/].\{66,\}"
"else
"    syn match   cobolBadLine      "^.\{6}[^*].\{66,\}"
"endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cobol_syntax_inits")
  if version < 508
    let did_cobol_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cobolBAD      Error
  HiLink cobolBadID    Error
  HiLink cobolBadLine  Error
" HiLink cobolMarker   Comment
  HiLink cobolCALLs    Function
  HiLink cobolComment  Comment
  HiLink cobolKeys     Comment
  HiLink cobolAreaB    Special
  HiLink cobolCompiler PreProc
  HiLink cobolCondFlow Special
  HiLink cobolCopy     PreProc
  HiLink cobolDecl     Type
  HiLink cobolExtras   Special
  HiLink cobolGoTo     Special
  HiLink cobolConstant Constant
  HiLink cobolNumber   Constant
  HiLink cobolPic      Constant
  HiLink cobolReserved Statement
  HiLink cobolString   Constant
  HiLink cobolTodo     Todo
  HiLink cobolWatch    Special
  HiLink cobolSect     MySections

  delcommand HiLink
endif

let b:current_syntax = "cobol"

" vim: ts=6 nowrap
