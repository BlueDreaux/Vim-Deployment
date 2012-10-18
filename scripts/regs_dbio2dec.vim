"Copy statements replace.
:%s'copy.*"\(.*\).cpy'copy \1 of "ucscopy:cpylib'g

"Deletes all SP2 statments.
:g/.*sp2.*/d

"Converts Connection logic.
:%s:\(\s*\)\(perform open_connection_logic\):if open_sw not = "Y"\r\1    \2\r\1end-if.
:%s:\(\s*\)\(accept.*\sdate[\.]*\n\s*call\s"opendb.*_stat\):\1if open_sw not = "Y"\r\1    \2\r\1end-if:|?date\.?|s/date\./date/

"Does String replaces for 'goback->stop run' and 'acudates->ucsdates'
:%s/goback/stop run/g
:%s/acudates/ucsdates/g


"These last two have to still be manually done but these will save you a bunch
"of editing and typing to do so.

"Loads the command that cleans up GUI blocks into register g so you can find
"blocks, place the cursor a line before them, open a command(:), press ctrl-R
"followed by g and return to replace the block preserving display statements.
let @g='/if external_gui = "y"/,/else/d|/end-if/|?.*$?|s/\r^\s*end-if//'

"Loads the commands that cleans up Start_key error checking blocks into
"register e so you can find blocks, place the cursor on the perform line, open
"a command(:), press ctrl-R followed by an e and return to replace the block
"with the appropriate Dec DBIO handling.
let @e='s:\(\s*\)\(perform sql_error_check[\.]\n\s*move\s*\(\d*\)\s*to\scur_num\):\1if   temp_opx not = 31\r\1 and temp_opx not = 41\r\1 and temp_opx not = 51\r\1    \2\r\1else\r\1    if sqlstate = "00000"\r\1        move \3 to cur_num\r\1    else\r\1        move 0 to cur_num\r\1    end-if\r\1end-if:|?_check\.?|s:\.::'
