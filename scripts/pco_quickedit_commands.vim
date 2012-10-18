"Don't waist time defining these commands if they're already defined.
if exists("g:pco_quickedit_set") 
    finish
else
    let g:pco_quickedit_set = 'true'
endif

"The following are some commands for dealing with quick editing to dbios using
"copybook lines as the base building block.
command! -range DBvarNull     call DBRegXVar(0)
command! -range DBvar         call DBRegXVar(1)
command! -range DBvarTimeNull call DBRegXVar(2)
command! -range DBvarTime     call DBRegXVar(3)
function! DBRegXVar(Type_Enum) range
    if a:Type_Enum == 0
        " Transform base block with pic defs into variable declaraions w/ nulls.
        '<,'>s/\s\+\d\+\s\+\([0-9A-Za-z]\+_\)\(\S\+\)\(\s\{4}\)\=\(\s\+\)\(pic.*\)/ 01 \2    \4\5\r 01 \2_ind\4pic s9(04) comp-5./
    elseif a:Type_Enum == 1
        "  w/o nulls
        '<,'>s/\s\+\d\+\s\+\([0-9A-Za-z]\+_\)\(\S\+\)\(\s\{4}\)\=\(\s\+\)\(.*\)/ 01 \2    \4\5/
    elseif a:Type_Enum == 2
        "  dates/timestamps w/ nulls
        '<,'>s/\s\+\d\+\s\+\([0-9A-Za-z]\+_\)\(\S\+\)\(\s\{4}\)\=\(\s\+\)\(.*\)/ 01 \2    \4pic x(26).\r 01 \2_ind\4pic s9(04) comp-5./
    elseif a:Type_Enum == 3
        "  dates/timestamps w/o nulls
        '<,'>s/\s\+\d\+\s\+\([0-9A-Za-z]\+_\)\(\S\+\)\(\s\{4}\)\=\(\s\+\)\(.*\)/ 01 \2    \4pic x(26)./
    endif
endfunction

command! -range DBselVar     call DBRegXSelVar(0)
command! -range DBselVarTime call DBRegXSelVar(1)
command! -range DBselVarDate call DBRegXSelVar(2)
function! DBRegXSelVar(Type_Enum) range
    if a:Type_Enum == 0
        " Transform base block into select listing.
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/\1\2\3,/
    elseif a:Type_Enum == 1
        "  timestamp
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/\1to_char(\2\3,'YYYYMMDDHH24MINSSFF'),/
    elseif a:Type_Enum == 2
        "  date
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/\1to_char(\2\3,'YYYYMMDD'),/
    endif
endfunction

command! -range DBselIntoVarNull call DBRegXSelIntoVar(0)
command! -range DBselIntoVar     call DBRegXSelIntoVar(1)
function! DBRegXSelIntoVar(Type_Enum) range
    if a:Type_Enum == 0
        " Transform base block into select's into listing w/ nulls.
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/\1:\3 indicator\r\1    :\3_ind,/
    elseif a:Type_Enum == 1
        "  w/o nulls.
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/\1:\3,/
    endif
endfunction

command! -range DBmoveFromVar     call DBRegXMoveFrom(0)
command! -range DBmoveFromVarTime call DBRegXMoveFrom(1)
command! -range DBmoveFromVarDate call DBRegXMoveFrom(2)
function! DBRegXMoveFrom(Type_Enum) range
    if a:Type_Enum == 0
        " Transform base block into move from sqls.
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/\1if \3_ind = -1\r\1    move zeroes spaces\r\1      to \2\3\r\1else\r\1    move \3\r\1      to \2\3\r\1end-if.\r/
    elseif a:Type_Enum == 1
        "  timestamp
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/\1if \3_ind = -1\r\1    move zeroes\r\1      to \2\3\r\1else\r\1    move \3(1:16)\r\1      to \2\3\r\1end-if.\r/
    elseif a:Type_Enum == 2
        "  date
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/\1if \3_ind = -1\r\1    move zeroes\r\1      to \2\3\r\1else\r\1    move \3(1:8)\r\1      to \2\3\r\1end-if.\r/
    endif
endfunction

command! -range DBmoveToVar     call DBRegXMoveTo(0)
command! -range DBmoveToVarTime call DBRegXMoveTo(1)
command! -range DBmoveToVarDate call DBRegXMoveTo(2)
function! DBRegXMoveTo(Type_Enum) range
    if a:Type_Enum == 0
        " Transform base block into move to sqls (w/ comment marks at beggining.
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/*\1if \2\3 = zeroes or spaces\r*\1    move -1 to \3_ind\r*\1else\r*\1    move \2\3\r*\1        to \3\r*\1end-if.\r*/
    elseif a:Type_Enum == 1
        "  timestamp
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/*\1if \2\3 = zeroes or spaces\r*\1    move -1\r*\1        to \3_ind\r*\1else\r*\1    string \2\3(1:4)"-"\r*\1           \2\3(5:2)"-"\r*\1           \2\3(7:2)" "\r*\1           \2\3(9:2)":"\r*\1           \2\3(11:2)":"\r*\1           \2\3(13:2)"."\r*\1           \2\3(15:2)\r*\1           delimited by size into \3\r*\1end-if.\r*/
    elseif a:Type_Enum == 2
        "  date
        '<,'>s/\(\s\+\)\([0-9A-Za-z]\+_\)\(\S\+\)/*\1if \2\3 = zeroes or spaces\r*\1    move -1\r*\1        to \3_ind\r*\1else\r*\1    string \2\3(1:4)"-"\r*\1           \2\3(5:2)"-"\r*\1           \2\3(7:2)" 00:00:00.00"\r*\1           delimited by size into \3\r*\1end-if.\r*/
    endif
endfunction


