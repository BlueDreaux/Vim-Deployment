" Vim color file
" Maintainer:	Drew Pilling <Drew.Pilling@shsu.edu>
" Last Change:	2007 Apr 06
" DarkGrey on Black

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "october"

" Hardcoded Colors :
" GUI Comment :    #80a0ff = Light Blue
" GUI Identifier : #0066ff = Deep Sky Blue
" search bg:	   #0033ff = Deep Sunlit Blue

" GUI
highlight Normal     guifg=DarkGrey	guibg=Black
highlight Visual     guifg=Grey25					gui=bold
highlight Cursor     guifg=Black	guibg=Green		gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=blue		guibg=white
highlight Statement  guifg=gold						gui=NONE
highlight Type										gui=NONE
highlight MatchParen guifg=black	guibg=#0066ff
highlight Identifier guifg=#0066ff
highlight Constant	 guifg=coral3
highlight PreProc	 guifg=green3
highlight Folded 	 guifg=red4		guibg=Black
highlight FoldColumn guifg=red4		guibg=Black
highlight search 	 guifg=black	guibg=#0033ff	gui=none
highlight Todo   	 guifg=yellow	guibg=red
highlight MySections 								gui=undercurl guisp=orange
highlight Pmenu		 guifg=grey61	guibg=grey19
highlight PmenuSel	 guifg=Black	guibg=salmon	

" Console
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Search     ctermfg=Black		ctermbg=Red		cterm=NONE
highlight Visual										cterm=reverse
highlight Cursor     ctermfg=Black		ctermbg=Green	cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=blue		ctermbg=white
highlight Statement  ctermfg=Yellow						cterm=NONE
highlight Type											cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red		cterm=bold	guifg=Black       guibg=Red		gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=Grey25					gui=bold
    highlight Special ctermfg=LightBlue				cterm=NONE	guifg=LightBlue					gui=NONE
    highlight Comment ctermfg=Cyan					cterm=NONE	guifg=LightBlue					gui=NONE
  endif
endif

