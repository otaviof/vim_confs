"Maintainer:    Greg Sexton <gregsexton@gmail.com>
"Last Change:   2011-03-24
"Version:       1.0
"URL:           http://www.gregsexton.org/vim-color-schemes/gravity-color/

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "gravity"


" General colors
hi Normal       guifg=#404040   guibg=#f0f0f0 gui=NONE
hi NonText      guifg=#f0f0f0   guibg=#f0f0f0 gui=NONE
hi Cursor       guifg=white     guibg=black   gui=NONE
hi LineNr       guifg=white     guibg=#c0d0e0 gui=NONE
hi VertSplit    guifg=#4b5e81   guibg=#4b5e81 gui=NONE
hi StatusLine   guifg=#ffffff   guibg=#2a3a57 gui=NONE
hi StatusLineNC guifg=#ffffff   guibg=#4b5e81 gui=NONE
hi Folded       guifg=#404040   guibg=#dcdcdc gui=NONE
hi Title        guifg=#101010   guibg=NONE    gui=BOLD
hi Visual       guifg=white     guibg=#A00000 gui=NONE
hi SpecialKey   guifg=#808080   guibg=#343434 gui=NONE
hi WildMenu     guifg=green     guibg=yellow  gui=NONE
hi PmenuSbar    guifg=black     guibg=white   gui=NONE
"hi Ignore      guifg=gray      guibg=black   gui=NONE
hi Error        guifg=NONE      guibg=NONE    gui=undercurl
hi ErrorMsg     guifg=white     guibg=#FF0000 gui=BOLD
hi WarningMsg   guifg=white     guibg=#FF0000 gui=BOLD
hi ModeMsg      guifg=#ff8a00   guibg=#f0f0f0 gui=BOLD
hi IncSearch    guifg=orangered guibg=white
hi Directory    guifg=#CB1014

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#c0d0e0     gui=NONE
  hi CursorColumn   guifg=NONE        guibg=#c0d0e0     gui=NONE
  hi MatchParen	    guifg=red         guibg=#f0f0f0     gui=BOLD
  hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE
  hi PmenuSel       guifg=#ffffff     guibg=#7d0000     gui=NONE
  hi Search	    guifg=white	      guibg=orangered   gui=NONE
endif

" Diff highlighting
hi DiffAdd          guifg=NONE    guibg=#b4de85 gui=NONE
hi DiffDelete       guifg=#9c9c9c guibg=#7c7c7c gui=NONE
hi DiffChange       guifg=NONE    guibg=#87c5dc gui=NONE
hi DiffText         guifg=#ffffff guibg=#a40004 gui=NONE

" Syntax highlighting
" TODO 
hi Comment          guifg=#707070     guibg=NONE        gui=NONE
hi String           guifg=#c40020     guibg=NONE        gui=NONE
hi Number           guifg=#c40020     guibg=NONE        gui=NONE
hi Keyword          guifg=#2a9400     guibg=NONE        gui=NONE
hi PreProc          guifg=#2a9400     guibg=NONE        gui=NONE
hi Conditional      guifg=#001ac4     guibg=NONE        gui=NONE
hi Todo             guifg=#8f8f8f     guibg=NONE        gui=NONE
hi Todo		        guifg=orangered
hi Constant         guifg=#c40020     guibg=NONE        gui=NONE
hi Identifier       guifg=#7800c4     guibg=NONE        gui=NONE
hi Function         guifg=#d8008e     guibg=NONE        gui=NONE
hi Type             guifg=#00A0A0     guibg=NONE        gui=NONE
hi Statement        guifg=#001ac4     guibg=NONE        gui=NONE
hi Special          guifg=#007958     guibg=grey80      gui=NONE
hi Delimiter        guifg=#000557     guibg=NONE        gui=NONE

hi Operator         guifg=#404040     guibg=NONE        gui=NONE
hi NonText                  gui=none        guifg=gray30        guibg=bg

hi iCursor                  gui=none        guifg=fg            guibg=green
hi lCursor                  gui=none        guifg=#ffffff       guibg=#8800ff


hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

"
" Perl's
"

hi perlControl              gui=none        guifg=#0c0c090       guibg=bg
hi perlFunctionName         gui=none        guifg=gray20        guibg=bg
hi perlIdentifier           gui=none        guifg=gray40        guibg=bg
hi perlLabel                gui=none        guifg=#c0c090       guibg=bg
hi perlMatchStartEnd        gui=none        guifg=#c0c090       guibg=bg
hi perlNumber               gui=none        guifg=#5faf5f       guibg=bg
hi perlOperator             gui=none        guifg=#c0c090       guibg=bg
hi perlPackageDecl          gui=none        guifg=#80ac7b       guibg=bg
hi perlQQ                   gui=none        guifg=gray65        guibg=bg
hi perlRepeat               gui=none        guifg=#c0b790       guibg=bg
hi perlSharpBang            gui=none        guifg=#c0c090       guibg=bg
hi perlShellCommand         gui=none        guifg=lightred      guibg=bg
hi perlSpecialBEOM          gui=none        guifg=fg            guibg=bg
hi perlSpecialMatch         gui=none        guifg=#c864c7       guibg=bg
hi perlSpecialString        gui=none        guifg=#dc966b       guibg=bg
hi perlStatement            gui=none        guifg=#c0c090       guibg=bg
hi perlStatementControl     gui=none        guifg=#dcdb6b       guibg=bg
hi perlStatementFiledesc    gui=none        guifg=#a2c090       guibg=bg
hi perlStatementHash        gui=none        guifg=#c0c090       guibg=bg
hi perlStatementInclude     gui=none        guifg=#c0c090       guibg=bg
hi perlStatementNew         gui=underline   guifg=#c0c090       guibg=bg
hi perlStatementSub         gui=none        guifg=#c0c090       guibg=bg
hi perlStringStartEnd       gui=italic      guifg=#dc966b       guibg=bg
hi perlVarNotInMatches      gui=none        guifg=#915555       guibg=bg
hi perlVarPlain             gui=none        guifg=#74c5c6       guibg=bg
hi perlVarPlain2            gui=none        guifg=#74c6a8       guibg=bg
hi perlVarSimpleMember      gui=none        guifg=#c0c090       guibg=bg
hi perlVarSimpleMemberName  gui=none        guifg=gray70        guibg=bg
hi perlSpecialDollar        gui=bold        guifg=white         guibg=black
hi perlVarBlock             gui=none        guifg=gray70        guibg=bg

"vim: sw=4
