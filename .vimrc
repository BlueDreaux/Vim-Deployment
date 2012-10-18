"SQL editing assocaited plugins commands.
set nocp
filetype plugin on

""This will expand the search range of your ctrl+p autofills. 
""Use ctrl+c to break out of the search early.
"set include=^\s*\(copy\|call\)\s*['\"]\=

"let b:match_words = '\<if\>:\<else\>:\(\<end-if\>\|\.\),\<string\>:\(\<end-string\>\|\.\),\(\s\+\)\@<=\([''"]\):\2\s\+'

""This automatically maximizes the window.
"autocmd GUIEnter * simalt ~x

"Set the syntax for VB.NET files.
autocmd BufWinEnter *.vb set filetype=vbnet

"These commands detect the appropriate compiler to use for cbl/eco files
autocmd BufWinEnter *.eco compiler esql
autocmd BufWinEnter *.pco compiler pco
autocmd BufWinEnter *.cbl compiler acucobol
autocmd BufWinEnter */mimer/source/subroutine/cbl/*\cdbio\.cbl,*/mimer/source/subroutine/cbl/*open*.cbl compiler mimprod
autocmd bufwinenter */mimer/oracle/*\cdbio.cbl,*/mimer/oracle/cbl/*open*.cbl compiler oraprod
autocmd BufWritePost *.cpy,*.cbl,*.eco,*.pco set filetype=cobol
autocmd BufWinEnter *.cpy,*.cbl,*.eco,*.pco set filetype=cobol
autocmd BufWinEnter *.PowerPro set filetype=powerpro
autocmd BufWinEnter *.ps1 set filetype=ps1

"Load a set of commands to allow for quicker additions to PCO files when new variables are requested.
autocmd BufReadPost *.pco source $VIM/vimfiles/scripts/pco_quickedit_commands.vim

"These commands will map the Alt+C key combo to (comment)/un\1 selections based on file type.
"Maps alt-c to comment lines
autocmd BufWinEnter *.cbl,*.cpy vmap <buffer> <A-c> :s/^/*/<cr>gv
autocmd BufWinEnter *.cbl,*.cpy nmap <buffer> <A-c> :s/^/*/<cr>
autocmd BufWinEnter *.cbl,*.cpy imap <buffer> <A-c> <esc>:s/^/*/<cr>i
autocmd BufWinEnter *.eco vmap <buffer> <A-c> :s/\(^.\{6\}\)\@<=/*/<cr>gv
autocmd BufWinEnter *.eco nmap <buffer> <A-c> :s/\(^.\{6\}\)\@<=/*/<cr>
autocmd BufWinEnter *.eco imap <buffer> <A-c> <esc>:s/\(^.\{6\}\)\@<=/*/<cr>i
autocmd BufWinEnter *\cdbio\.cbl vmap <buffer> <A-c> :s/\(^.\{6\}\)\@<=/*/<cr>gv
autocmd BufWinEnter *\cdbio\.cbl nmap <buffer> <A-c> :s/\(^.\{6\}\)\@<=/*/<cr>
autocmd BufWinEnter *\cdbio\.cbl imap <buffer> <A-c> <esc>:s/\(^.\{6\}\)\@<=/*/<cr>i
"Maps alt-C to uncomment lines
autocmd BufWinEnter *.cbl,*.cpy vmap <buffer> <A-C> :s/^\*//<cr>gv
autocmd BufWinEnter *.cbl,*.cpy nmap <buffer> <A-C> :s/^\*//<cr>
autocmd BufWinEnter *.cbl,*.cpy imap <buffer> <A-C> <esc>:s/^\*//<cr>i
autocmd BufWinEnter *.eco vmap <buffer> <A-C> :s/\(^.\{6\}\)\@<=\*//<cr>gv
autocmd BufWinEnter *.eco nmap <buffer> <A-C> :s/\(^.\{6\}\)\@<=\*//<cr>
autocmd BufWinEnter *.eco imap <buffer> <A-C> <esc>:s/\(^.\{6\}\)\@<=\*//<cr>i
autocmd BufWinEnter *\cdbio\.cbl vmap <buffer> <A-C> :s/\(^.\{6\}\)\@<=\*//<cr>gv
autocmd BufWinEnter *\cdbio\.cbl nmap <buffer> <A-C> :s/\(^.\{6\}\)\@<=\*//<cr>
autocmd BufWinEnter *\cdbio\.cbl imap <buffer> <A-C> <esc>:s/\(^.\{6\}\)\@<=\*//<cr>i

""These set up our :find command to look for our file in the following directories
"set path=c:/development/acucobol/sp2/source/subroutine/branch/**1
"set path+=c:/development/acucobol/sp2/source/subroutine/**1
"set path+=c:/development/acucobol/sp2/source/branch/**1
"set path+=c:/development/acucobol/sp2/source/**1
"set path+=c:/development/acucobol/sp2/**1
"set path+=c:/development/acucobol/acucobol/copylib/branch/**1
"set path+=c:/development/acucobol/acucobol/copylib/**1
"set path+=c:/development/acucobol/acucobol/source/subroutine/branch/**1
"set path+=c:/development/acucobol/acucobol/source/subroutine/**1
"set path+=c:/development/acucobol/acucobol/source/branch/**1
"set path+=c:/development/acucobol/acucobol/source/**1
"set path+=c:/development/mimer/source/subroutine/eco/branch/**1
"set path+=c:/development/mimer/source/subroutine/eco/**1
"set path+=c:/development/mimer/source/subroutine/cbl/**1
"set path+=c:/development/mimer/sql/**
"set path+=c:/development/mimer/Oracle/pco/branch/**1
"set path+=c:/development/mimer/Oracle/pco/**1
"set path+=c:/development/mimer/Oracle/cbl/**1
"set path+=c:/development/mimer/Oracle/sql/**
"set path+=c:/development/php_dev/**

"This is a list of extensions that will be added to the search term when using :find, etc
set sua=.eco,.pco,.cbl,.cpy,.sql 


"Behavior Options
set hlsearch
set autoindent
set ignorecase
set smartcase
set nowrap
autocmd BufWinEnter *.txt,*.html set wrap!
autocmd BufWinEnter *.txt,*.html set lbr!
"set encoding=utf-8
set ss=10
set writebackup
set nobackup
set directory=~/.vim/_temp

"This mapping will split the filename under the cursor to the right
map <silent> <C-l> :vert bo sfind <cfile><cr>
"This mapping will split the filename under the cursor to the top
map <silent> <C-j> :sfind <cfile><cr>
"Maps to have tabs behave more like other windows programs 
map <silent> <C-TAB> <esc>:tabnext<cr>
map <silent> <S-C-TAB> <esc>:tabprev<cr>
map <silent> <c-T> <esc>:tabnew<cr>
map <silent> <c-F4> <esc>:tabclose<cr>

"Mappings to make a debug message code appear for the variable under the cursor.
"yiw is to yank inner word.
"o is to go to next line and insert. O is to insert replacing the current line from ^. 
"4j is to move 4 lines up. 
":.,.+3 means this line and the 3 after. 
"<c-r>" is ctrl-r " to use what's in the " register.
nmap cd yiwo<esc>o* DEBUGGING - BEGIN<cr>       initialize sp2_lg_ms_text, sp2_lg_ms_title<cr>move "Debugging" to sp2_lg_ms_title<cr>string "varx: "varx x"0A0D" delimited by size into sp2_lg_ms_text<cr>perform long_info_msg<cr><esc>O* DEBUGGING - END<cr><esc>5j:.,.+3s/varx/<c-r>"/g<cr>

nmap date yiw:s/\(<c-r>0\)/to_char(\1, 'YYYY-MM-DD')/<cr>
nmap todate yiw:s/\(<c-r>0\)/to_date(\1, 'YYYY-MM-DD')/<cr>

"The below invert the j and k keys so that they are sensible
"and motion with the h and l keys along the identity line.
"Thus j now moves up and k now moves down. Sensible!
"noremap j k
"noremap k j
"For some reason the inverse feels more natural so we're 
"leaving it the way it was.



"View options
"set guifont=Arial_Monospaced:h8:cANSI
set number
set tabstop=4
set shiftwidth=4
set expandtab
retab 4
"set lines=57
"set columns=150
set ruler
set foldcolumn=2
"set foldmethod=syntax  <-- This is here for when the Cobol syntax file can set things up to handle this.
syntax on
redraw!
so $VIMRUNTIME/colors/october.vim

" Strips Page Break insertions in AcuCOBOL listing files.
"command StripPageBreaks 5;/^Close file:/ g/^\(\s\+\d\+\)\@!/d

"Here's a command that pulls up an HTML file letting us get a feel for colors.
"command ColorSampler call system("~/.vim/rgbtxt.html")

"Here's a command that sets the foldmethod to syntax and then back to manual.
command Folds call Fdm_Syntax_then_Manual()
command Forest call Fdm_Syntax_then_Manual()

"Functions
function Fdm_Syntax_then_Manual()
"&var is a setting option | $var is an internal variable | var is a regular variable
    if &filetype=='php'
        setlocal foldmethod=manual
        EnableFastPHPFolds
    else
        set fdm=syntax
        redraw!
        set fdm=manual
    endif
endfunction

command! EchoTime silent call EchoDateTime()

function EchoDateTime()
"   Echos the date and time to the current file via the system command prompt.
    .!echo \%Date:~-4\%/\%Date:~4,5\% \%time:~0,8\%
endfunction

function CleanupCOBOL()
"   This changes most of the COBOL source to lowercase source so it's easier on the eyes.
"   It also converts all - to _ where necessary.

"   First remove all trailing spaces and redundant blank lines to speed things up.
    %s:\s\+$::
    %s:\n\n\n\+:\r\r:
    %s:\n\n\+\(\s*\)copy:\r\1copy:c

"   Next convert all ***************$ sequences to only sets of 13 * before the end of the line.
    %s:\*\*\*\*\*\*\**$:*************:

"   Now convert all my - to _ with the knowledge that we will convert all _ to - where we need to.
    %s:\w\zs-\ze[^0-9 ]:_:g
"   Even though we're converting _ to - where needed remember to eyeball character strings.
    %s:\<end_\(evaluate\|if\|perform\|read\|search\|string\|unstring\)\>:\Lend-\1:g
    %s:\<program_id\>:program-id:
    %s:\<input_output\>:input-output:
    %s:\<file_control\>:file-control:
    %s:\<working_storage\>:working-storage:
"   Fix quoted lines to use - instead of _.
    %s:^.*\"[^\"]*\zs_\ze[^\"]*\":-:gc


"   Convert all io calls to the same case to avoid multiple linkings.
    %s:['"]\zs\(\S*io['"]\):\L\1:g

"   Make all variable names with _ in them lower-case. Then make common single words lowercase.
    %s:\(\S*\)_\(\S*\):\L\1_\2:g
    %s:\<add\>:add:g
    %s:\<and\>:and:g
    %s:\<ascending\>:ascending:g
    %s:\<at\>\s\+\<end\>:at end:g
    %s:\<by\>:by:g
    %s:\<call\>:call:g
    %s:\<close\>:close:g
    %s:\<compute\>:compute:g
    %s:\<comp-:comp-:g
    %s:\<continue\>:continue:g
    %s:\<copy\>:copy:g
    %s:\<delimited\>:delimited:g
"   %s:\<down\>:down:g
    %s:\<else\>:else:g
    %s:\<escapex\.:escapex.:g
    %s:\<evaluate\>:evaluate:g
    %s:\<exit\>:exit:g
    %s:\<giving\>:giving:g
    %s:\<\go\>\s\+\<to\>:go to:g
    %s:\<if\>:if:g
    %s:\<indexed\>:indexed:g
    %s:\<initialize\>:initialize:g
    %s:\<input\>:input:g
    %s:\<into\>:into:g
    %s:\<key\>:key:g
    %s:\<low_values\>:low-values:g
    %s:\<move\>:move:g
    %s:\<not\>:not:g
    %s:\<null_semyr\>:null_semyr:g
    %s:\<occurs\>:occurs:g
    %s:\<open\>:open:g
    %s:\<or\>:or:g
    %s:\<output\>:output:g
    %s:\<perform\>:perform:g
    %s:\<pic\>:pic:g
    %s:\<pic\>\s\+\zs\([sxz]*\):\L\1:g
    %s:\<pointer\>:pointer:g
    %s:\<qpr\>:qpr:g
    %s:\<read\>:read:g
    %s:\<search\>:search:g
    %s:\<section\>:section:g
    %s:\<set\>:set:g
    %s:\<setval\>:setval:g
    %s:\<size\>:size:g
    %s:\<sort\>:sort:g
    %s:\<space\>:space:g
    %s:\<spaces\>:spaces:g
    %s:\<sp2\>:sp2:g
    %s:\<string\>:string:g
    %s:\<then\>:then:g
    %s:\<times\>:times:g
    %s:\<to\>:to:g
    %s:\<true\>:true:g
    %s:\<unstring\>:unstring:g
    %s:\<until\>:until:g
"   %s:\<up\>:up:g
    %s:\<using\>:using:g
    %s:\<when\>:when:g
    %s:\<when\>\s\+\<other\>:when other:g
    %s:\<with\>:with:g
    %s:\<write\>:write:g
    %s:\<zero\>:zero:g
    %s:\<zeroes\>:zeroes:g
    %s:\<zeros\>:zeros:g
endfunction


function CleanupIndentation()
"   Fixes indentations to use 4 spaces so there is uniformity.
    %s:\t:    :g
    %s:^\s\{63\}\(\S\):                                                            \1:
    %s:^\s\{62\}\(\S\):                                                            \1:
    %s:^\s\{61\}\(\S\):                                                            \1:
    %s:^\s\{59\}\(\S\):                                                        \1:
    %s:^\s\{58\}\(\S\):                                                        \1:
    %s:^\s\{57\}\(\S\):                                                        \1:
    %s:^\s\{55\}\(\S\):                                                    \1:
    %s:^\s\{54\}\(\S\):                                                    \1:
    %s:^\s\{53\}\(\S\):                                                    \1:
    %s:^\s\{51\}\(\S\):                                                \1:
    %s:^\s\{50\}\(\S\):                                                \1:
    %s:^\s\{49\}\(\S\):                                                \1:
    %s:^\s\{47\}\(\S\):                                            \1:
    %s:^\s\{46\}\(\S\):                                            \1:
    %s:^\s\{45\}\(\S\):                                            \1:
    %s:^\s\{43\}\(\S\):                                        \1:
    %s:^\s\{42\}\(\S\):                                        \1:
    %s:^\s\{41\}\(\S\):                                        \1:
    %s:^\s\{39\}\(\S\):                                    \1:
    %s:^\s\{38\}\(\S\):                                    \1:
    %s:^\s\{37\}\(\S\):                                    \1:
    %s:^\s\{35\}\(\S\):                                \1:
    %s:^\s\{34\}\(\S\):                                \1:
    %s:^\s\{33\}\(\S\):                                \1:
    %s:^\s\{31\}\(\S\):                            \1:
    %s:^\s\{30\}\(\S\):                            \1:
    %s:^\s\{29\}\(\S\):                            \1:
    %s:^\s\{27\}\(\S\):                        \1:
    %s:^\s\{26\}\(\S\):                        \1:
    %s:^\s\{25\}\(\S\):                        \1:
    %s:^\s\{23\}\(\S\):                    \1:
    %s:^\s\{22\}\(\S\):                    \1:
    %s:^\s\{21\}\(\S\):                    \1:
    %s:^\s\{19\}\(\S\):                \1:
    %s:^\s\{18\}\(\S\):                \1:
    %s:^\s\{17\}\(\S\):                \1:
    %s:^\s\{15\}\(\S\):            \1:
    %s:^\s\{14\}\(\S\):            \1:
    %s:^\s\{13\}\(\S\):            \1:
    %s:^\s\{11\}\(\S\):        \1:
    %s:^\s\{10\}\(\S\):        \1:
    %s:^\s\{9\}\(\S\):        \1:
    %s:^\s\{7\}\(\S\):    \1:
    %s:^\s\{6\}\(\S\):    \1:
    %s:^\s\{5\}\(\S\):    \1:
endfunction

function CleanupSearchTerms()
"   This allows me to cat copybooks into s:\scripts\Data_Files\SEARCHTERM.txt
"   and then to cleanup the resulting searchterms so that they'll work with my
"   search script.
    g/^*/d
    %s:\s\+\zspic\s\+::g
    %s:^\s*\d\+\s\+::
    %s:\s\+\x(.*$::
    %s:\s\+x.*::
    %s:\s\+[s]*\d\+.*::
    %s:\.\s\+$::
    %s:[-_]:[-_]:g
    %s:\(.*\):\L\1:
endfunction

function CleanupPCOs()
    %s:\s\+$::
    %s:\(\s\+linkage section\):*\tend.\r\1:
    %s:\(01\s\+file_statx\s\+pic\s\+xx\.\):\1\r*\tend.:
    %s:procedure division using.*\zs\n\s\+\ze: :
    %s:\(exit program\.\):\1\r*\tend.:
    %s:iodb03\.cpy:iodb03_oracle.cpy:
    %s:declare\s\+\S\+\s\+cursor\zs\s\ze: with hold :
    %s:select\s\+[^,]\+\zs,\ze:,\r\t\t\t\t\t:
    %s:order by\s\+[^,]\+\zs,\ze:,\r\t\t\t\t\t:
    %s:if temp_opx\s\+not\s\+=\s\+31\s\+and\s\+temp_opx\s\+not\s\+=\s\+41\n\s\+and\s\+temp_opx\s\+not\s\+=\s\+51:if temp_opx not = 31 and not = 41 and not = 51:
    %s:\zs\n\s\+\zeindicator:\t\t:
endfunction

function CleanupOraSQLs()
"   Ampersands in Oracle litteral strings end the string so we need
"   to allow that and then append the next portion of the string.
    %s:&:&'||':g
    %s:\('\d\d\d\d-\d\d-\d\d'\):to_date(\1, 'yyyy-mm-dd'):g
    %s:\('\d\d\d\d-\d\d-\d\d \d\d\:\d\d\:\d\d\.\d*'\):timestamp \1:g
endfunction

function CleanupMimSQLs()
"   Similar to CleanupOraSQLs but converts things for the Mimer IO routines.
    %s:\('\d\d\d\d-\d\d-\d\d \d\d\:\d\d\:\d\d\.\d\+'\):cast (\1 as timestamp):g
endfunction

function CleanupGreaseMonkey()
"   Cleans up CSS in GreaseMonkey scripts so I can put quotes around it
"   without existing quotes terminating the string.
    %s:\([^\\]\)":\1\\":gc
    3,$-2s:\(.*\):"\1"+:
    $-1s:\(.*\):"\1";:
    /a;lfja;lkfakl;sdf
endfunction

"command! PrepFTP silent !echo %:t >"C:\Program Files\PowerPro\scripts\data\File_to_FTP.lis"
"command! FTPDev silent !"C:\Program Files\PowerPro\scripts\ftpVimDBio.PowerPro"
"        FTPDev ftps file from c:\mimer\object to acutsub.
"command! FTPDevMim silent !"C:\Program Files\PowerPro\scripts\everftp_cobol.PowerPro"
"        FTPDevMim ftps file from c:\shsutest\Object to acutsub or acut,
"        depending on whether it's an IO or program.
"command! FTPDevOra silent !"C:\Program Files\PowerPro\scripts\ftpVimAcuDBio.PowerPro"
"        FTPDevOra ftps file from c:\oracle\object to acutsub.
"function! UploadMimer()
"    PrepFTP
"    FTPDev
"endfunction
"function! UploadOracle()
"    PrepFTP
"    FTPDevOra
"endfunction

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


function! CountMatches(pattern, startline, endline) range
" CountMatches counts the number of times a pattern matches a range of lines.
    let l:match_count = 0

    let l:restore_cursor = "normal!" . line(".") . "G" . virtcol(".") . "|"
    normal! H
    let l:restore_screen = line(".") . "normal!zt"

        " move cursor to 1st line of search range
    exec "normal!" . a:startline . "G0"
    
        " loop over the lines of the search range looking for pattern
    while 1
        let l:lnum = search(a:pattern, "W")

            " break loop if we are outside of the search range or we didn't
            " find a match (l:lnum == 0)
        if l:lnum > a:endline || l:lnum == 0
            break  
        endif  

        let l:match_count = l:match_count + 1
    endwhile

    exec l:restore_screen
    exec l:restore_cursor

        " tell the user how many matches we found
    echo "Pattern matched " . l:match_count . " times."
endfunction

" Define a command to call the above function
com! -range -nargs=1 CM call CountMatches("<args>", <line1>, <line2>) 


