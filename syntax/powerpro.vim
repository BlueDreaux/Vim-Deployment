" Vim syntax file
" Language:    Powerpro Script language
" Maintainer:  Whoever wants to!
" Last Change: Sun 04/27/2003
" Version:     0.02

" NOTES:
"

" To Do List: Heh! Too much to list here.
"


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"++++++++++++++++++++++++++++++++++++++++++++++
" REMOVE THESE: Good for testing. Put some funky
" colors here so that certain highlighting *can't* be
" missed. Delete these otherwise.
"

"highlight Constant guifg=darkblue
"highlight Statement guifg=red3
"highlight PreProc gui=bold guifg=blue
"highlight Function guifg=steelblue
"
"highlight Label gui=bold guifg=black
"highlight Comment gui=italic guifg=darkgreen
"
"highlight Operator guifg=NONE
"highlight String guifg=darkblue
"highlight Number guifg=red guibg=white
""highlight Keyword guifg=lightblue
"highlight Special guifg=orange
"++++++++++++++++++++++++++++++++++++++++++++++


syn case ignore

" Works:
" PowerPro Comment - Snagged a few lines from the vim.vim syntax file. I like
" the extra coloring for comment titles and so forth. Added "\a\+" to get rid
" of situations where a comment line might begin with a drive and filepath
" such as C:\windows\something.exe. Otherwise "C:" is highlighted as a comment
" title.

syn match PproComment "^[ \t:]*;.*$" contains=PproCommentTitle
syn match PproCommentTitle ";\s*\u\a\+\(\s\+\u\a\+\)*:"hs=s+1 contained


" Works:
" PowerPro Labels
" Can exist alone on a single line or be followed by a command.

"syn match PproLabel /@.*/ -->Do we really need a region?
syn region PproLabel  start="^@"  end="\_s"
syn match  PproLabel "\(\<\*jump\s\+\|\<jump\s\+\)\@<=\(\w\)*"


" Works:
" PowerPro strings do we multi-line?
syn region PproString  start=/"./ end=/"/  oneline


" PowerPro numbers
" Comment these out if one doesn't like this.
" Noticed collision with iskeyword (*) Quick and dirty fix!
syn match Ppronumber "\<\d\+\>"
syn match Ppronumber "\*\d\+\>"hs=s+1


"PowerPro Variables - Just a Test Here.
"
"syn match PproVariable "\<[a-zA-Z0-9\_]\{1,23}" contained


"PowerPro Expression Match
"Problematic. So what, nothing really contained anyway!
"syn match PproActions "([^)]*)" contains=PproFunctions,ProVariable,Ppronumber


"PowerPro Embeded Command Matches (Quick And Dirty)
"None of these work as intended!
"syn region PproString start="\<\*message\s"lc=8 end="*\|\s\*"me=e-1 contains=PproNumber,PproCommand
"syn match PproString "\<\*debug\s.*"lc=7
"syn match PproString "\<\*exec\sprompt\s.*"lc=13 contains=PproNumber,PproVariable,PproCommands


"PowerPro Special Highlighting - Unusual matches here?
"
"Highlight a drive+file path with or without quoates?
"This pattern assumes a " may or may not exist. Don't need it as the
"Pprostring region already takes care of this.
"syn match PproString +\("[A-Za-z]\|[A-Za-z]\):\\.*\("|\$\)*+

"This match works for non-quote lines, but may collide with other lines and
"also cause a double match thing with the string region. Just best to tell
"user to always quote drive and path statements?

"syn match Error +\s*\<\([A-Za-z]\):\\.*+
" syn match Error +[^"]\zs\([A-Za-z]\):\\\S*+
syn match Error +[^"]\zs\([A-Za-z]\):\\.*\s.*\\+


" Auxillery Actions/Parameters Keywords
syn keyword PproActions  active activity alarms all arrange automin autopress
syn keyword PproActions  autorun autoscroll back backshow barverticalline
syn keyword PproActions  browserun calccalendar calendar capture center change
syn keyword PproActions  changeconfiguration changerestart changetimeout changeto
syn keyword PproActions  clear clearallclose clearclip clearclipboard clearrecent
syn keyword PproActions  clearrecentexplorer cliptrackon close closeforce command
syn keyword PproActions  commandline commandlist commandrandom consolidate context
syn keyword PproActions  contextif contextmenu copy copyrandom copythentofile
syn keyword PproActions  createorswitchto cut delete deletenorecycle dialog disable
syn keyword PproActions  done drag emptyrecyclebin enable endcontext endsubmenu
syn keyword PproActions  explorer explorer2 extchange file fileipaste filepaste
syn keyword PproActions  findcomputer findfiles folder gui hide hideicons hideshow
syn keyword PproActions  hideshowicons hideshowtaskbar hideshowwindows hidetaskbar
syn keyword PproActions  hidewindow hotkeys icontextcolor item key key/mouse left
syn keyword PproActions  leftclick leftdouble leftdown leftup logkeys logoff
syn keyword PproActions  maxnormal media menuipaste menupaste middle middleclick
syn keyword PproActions  middledouble middledown middleup minmemory minrestore
syn keyword PproActions  minshowwindows monitor move moveactive moveautorun mute
syn keyword PproActions  new newbarrow newbarrowline newcolumn newcolumnline
syn keyword PproActions  newfolder newfromlist newremindermessage next noactive
syn keyword PproActions  noalt noctrl nomodem nopath normal nosaver noshift
syn keyword PproActions  notontop nottop novisiblewindow nowindow ontop paste path
syn keyword PproActions  position postmessage powerpro previous print prompt ready
syn keyword PproActions  reboot recent refreshenvironment relative rename
syn keyword PproActions  replacebylist resolution restart restore restoreicons
syn keyword PproActions  restorelastmin right rightclick rightdouble rightdown
syn keyword PproActions  rightup rollup runfile runrandom save saveicons
syn keyword PproActions  saveiconsgrid scheduler scheduleradd screen scroll
syn keyword PproActions  scrollwindow scrollwithmouse selectsubbar
syn keyword PproActions  selectsubbartobutton selectsubbartomouse sendmessage
syn keyword PproActions  separator set setenv setup show showatbutton showicons
syn keyword PproActions  showmenu showtaskbar showtaskbarautohide size sleep standby
syn keyword PproActions  start startmenu startstop startsubmenu stop style
syn keyword PproActions  switchmenu switchto tempdisable text textappend textpaste
syn keyword PproActions  tile timers tofile tofileappend tomouse topnottop trans
syn keyword PproActions  transicontext tray traymin undermouse volumeall volumewav
syn keyword PproActions  volumewavwi windowinfo windows PostMessage SendMessage
syn keyword PproActions  deleteold


"Power Pro Keyword Values
syn keyword PproValues  acdc alt batterypercent browserDomain browserSubdomain
syn keyword PproValues  browserURL caption captionunder cdcurtrack cdlasttrack
syn keyword PproValues  clip cliptrackon cpu ctrl currentdir date dayofweekdayofyear
syn keyword PproValues  defaultprinter deskempty deskname desknum disk dunidle
syn keyword PproValues  dunrate exefilename exefullpath gdi inputcolor inputdatetime
syn keyword PproValues  inputfolder inputpath inputtext inputtime keylog keylogfile
syn keyword PproValues  lastactivehandle lastautorunhandle lastclipname lastclippath
syn keyword PproValues  lastidletime longdate modem mouseleft mousemiddle
syn keyword PproValues  mouseright muted paper pmem pprofolder pproversion
syn keyword PproValues  processcount recycleItems recycleSize saver saveractive
syn keyword PproValues  shift shortdate subbarname threadcount time timesec timezone
syn keyword PproValues  unixtime uptime user volume win xmouse xscreen xtime
syn keyword PproValues  ymouse yscreen


"PowerPro One Operand Functions
syn keyword PproFunctions  activewindow anywindow env input inputcancel length
syn keyword PproFunctions  mci mounted not random timer timerrunning validpath
syn keyword PproFunctions  vdeskempty visiblewindow nowindow


"PowerPro Two Operand Functions
syn keyword PproFunctions  assign case diskspace fill formatdate formattime if
syn keyword PproFunctions  ifelse index inputdefault inputdialog join max
syn keyword PproFunctions  messagebox min plugin readline remove repeat
syn keyword PproFunctions  replacechars revindex select vdeskhaswindow window
syn keyword PproFunctions  word


" PowerPro Plugin calls are here. Setting iskeyword with +"." to allow. Since
" these can be used as replacements for top level commands Highlight as a
" statement.

"Clip Plugin
syn keyword PproPlugins clip.get clip.set clip.append clip.clear clip.length
syn keyword PproPlugins clip.fromfile clip.fromfileappend clip.tofile
syn keyword PproPlugins clip.tofileappend clip.unload

"Date plugin
syn keyword PproPlugins date.today date.adddays date.sub date.weekday
syn keyword PproPlugins date.yearday date.weeknum date.get date.unload

"File Plugin
syn keyword PproPlugins file.open file.close file.closeall file.restart
syn keyword PproPlugins file.readline file.readstring file.eof file.writeline
syn keyword PproPlugins file.writestring file.setmaxline file.delete
syn keyword PproPlugins file.deletenorecycle file.copy file.move file.unload

"Float Plugin
syn keyword PproPlugins float.add float.sub float.mul float.divide float.compare
syn keyword PproPlugins float.ceiling float.truncate float.display float.displaydec
syn keyword PproPlugins float.unload

"Vec Plugin
syn keyword PproPlugins vec.create vec.destroy vec.exists vec.set vec.get
syn keyword PproPlugins vec.insert vec.delete vec.grow vec.capacity vec.length
syn keyword PproPlugins vec.sort vec.unload

"Win Plugin
syn keyword PproPlugins win.left win.right win.top win.bottom win.width win.height
syn keyword PproPlugins win.handle win.handleatpoint win.handlelist win.caption
syn keyword PproPlugins win.class win.exepath win.maxxed win.minned win.topmost
syn keyword PproPlugins win.rolled win.trayminned win.resizable win.maxable
syn keyword PproPlugins win.minable win.toolwindow win.close win.closeforce
syn keyword PproPlugins win.rollup win.traymin win.ontop win.show win.hide
syn keyword PproPlugins win.minimize win.maximize win.restore win.move win.size
syn keyword PproPlugins win.sendkeys win.debug win.sendmessage win.postmessage
syn keyword PproPlugins win.childtextbyindex win.unload


" Upper Level PowerPro Commands
" Last definined keywords take precedence. So now the upper level
" commands do to. Still need to contain things, even more so now.
syn keyword PproCommands  *assign *bar *break *clip *configure *debug *desktop
syn keyword PproCommands  *else *elseif *endfor *endif *exec *file *flag
syn keyword PproCommands  *for *format *if *ifelse *ifx *info *jump *keys
syn keyword PproCommands  *macro *menu *message *mouse *note *quit *run
syn keyword PproCommands  *screensaver *script *shutdown *timer *trayicon
syn keyword PproCommands  *vdesk *wait *wallpaper *window *dos

syn keyword PproCommands  assign bar break clip configure debug desktop
syn keyword PproCommands  else elseif endfor endif exec file flag
syn keyword PproCommands  for format if ifelse ifx info jump keys
syn keyword PproCommands  macro menu message mouse note quit run
syn keyword PproCommands  screensaver script shutdown timer trayicon
syn keyword PproCommands  vdesk wait wallpaper window dos


" Some of these can be uased at the end of commands. Also, a quick fix for
" If() Do.
syn keyword PproCommands  *min *max *traymin *takefocus *hide do


"PowerPro Operators
" Could just as well put them all into a match?
"   *   /   %   +   -   ++   ==   !=   <   <=   >   >=   &   |
"   eq   ne   lt   le   gt   ge   and   or


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_powerpro_syn_inits")
  if version < 508
    let did_powerpro_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
endif


" Sticking with the main default syntax highlighting groups defined in
" \sytax\syncolor.vim. (For Now...)

  HiLink PproCommands      Statement
  HiLink PproPlugins       Statement

  HiLink PproActions       PreProc
  HiLink PproValues        Keyword
  HiLink PproFunctions     Function
  HiLink PproOperators     Operator

  HiLink PproString        String
  HiLink PproNumber        Number
  HiLink PproVariable      Special

  HiLink PproLabel         Label
  HiLink PproComment       Comment

  HiLink PproSpecial       Special
  HiLink PproCommentTitle  PreProc
  HiLink Pprotest          PreProc

  delcommand HiLink
endif

let b:current_syntax = "PowerPro"

" vim:ts=5
