" Vim color file
" Maintainer:   Michael Piefel <piefel@informatik.hu-berlin.de>
" Last Change:  2001 Aug 16
" Licence:      Public Domain

" This color scheme uses a White background. It's based on Bram's
" morning theme, but doesn't try to work for non-GUI editing.
"
" It's supposed to look like the Emacs standard colors, at least
" for C. But Emacs has different categories, so it's not very good.

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "emacs"

hi Normal                   gui=none            guifg=gray10        guibg=gray95
hi Comment                  gui=italic          guifg=blue          guibg=gray95
hi Constant                 gui=none            guifg=darkcyan      guibg=bg
hi Cursor                   gui=none            guifg=fg            guibg=orange
hi CursorLine               gui=none            guifg=NONE          guibg=gray90
hi CursorIM                 gui=none            guifg=black         guibg=green
hi DiffAdd                  gui=none            guifg=fg            guibg=lightblue
hi DiffChange               gui=none            guifg=fg            guibg=lightmagenta
hi DiffDelete               gui=bold            guifg=blue          guibg=lightcyan
hi DiffText                 gui=bold            guifg=fg            guibg=red
hi Directory                gui=none            guifg=blue          guibg=bg
hi ErrorMsg                 gui=none            guifg=white         guibg=red
hi Error                    gui=bold            guifg=white         guibg=red
hi FoldColumn               gui=none            guifg=darkblue      guibg=grey
hi Folded                   gui=none            guifg=darkblue      guibg=white
hi Ignore                   gui=none            guifg=darkslategray guibg=bg
hi IncSearch                gui=reverse         guifg=fg            guibg=bg
hi iCursor                  gui=none            guifg=fg            guibg=green
hi Identifier               gui=none            guifg=darkyellow    guibg=bg
hi LineNr                   gui=none            guifg=gray50        guibg=gray90
hi ModeMsg                  gui=bold            guifg=fg            guibg=bg
hi MoreMsg                  gui=bold            guifg=seagreen      guibg=bg
hi OverLength               gui=none            guifg=fg            guibg=gray30
hi PreProc                  gui=none            guifg=darkmagenta   guibg=bg
hi Question                 gui=bold            guifg=seagreen      guibg=bg
hi Search                   gui=bold            guifg=fg            guibg=yellow
hi Special                  gui=none            guifg=slateblue     guibg=bg
hi SpecialKey               gui=bold            guifg=blue          guibg=bg
hi Statement                gui=none            guifg=brown         guibg=bg
hi StatusLine               gui=reverse,italic  guifg=gray90        guibg=gray30
hi StatusLineNC             gui=reverse         guifg=fg            guibg=bg
hi SignColumn               gui=none            guifg=darkyellow    guibg=bg
hi Title                    gui=italic          guifg=darkyellow    guibg=bg
hi Todo                     gui=bold            guifg=#ff80d0       guibg=bg
hi Type                     gui=none            guifg=darkgreen     guibg=bg
hi VertSplit                gui=none            guifg=gray30        guibg=gray90
hi Visual                   gui=reverse         guifg=grey          guibg=fg
hi VisualNOS                gui=underline,bold  guifg=fg            guibg=bg
hi WarningMsg               gui=none            guifg=red           guibg=bg
hi WildMenu                 gui=none            guifg=black         guibg=yellow
hi LCursor                  gui=none            guifg=fg            guibg=cyan
hi NonText                  gui=bold            guifg=blue          guibg=grey90
hi MyTagListFileName        gui=underline       guifg=fg            guibg=bg
hi TagListTagName           gui=underline       guifg=fg            guibg=bg

"
" Perl
"

hi perlControl              gui=none            guifg=#c0c090       guibg=bg
hi perlFunctionName         gui=none            guifg=white         guibg=bg
hi perlIdentifier           gui=none            guifg=gray75        guibg=bg
hi perlLabel                gui=none            guifg=#c0c090       guibg=bg
hi perlMatchStartEnd        gui=none            guifg=#c0c090       guibg=bg
hi perlNumber               gui=none            guifg=#80ac7b       guibg=bg
hi perlOperator             gui=none            guifg=#c0c090       guibg=bg
hi perlPackageDecl          gui=none            guifg=#80ac7b       guibg=bg
hi perlQQ                   gui=none            guifg=fg            guibg=bg
hi perlRepeat               gui=none            guifg=#c0b790       guibg=bg
hi perlSharpBang            gui=none            guifg=#c0c090       guibg=bg
hi perlShellCommand         gui=none            guifg=lightred      guibg=bg
hi perlSpecialBEOM          gui=none            guifg=fg            guibg=bg
hi perlSpecialDollar        gui=bold            guifg=white         guibg=black
hi perlSpecialMatch         gui=none            guifg=#c864c7       guibg=bg
hi perlSpecialString        gui=none            guifg=#dc966b       guibg=bg
hi perlStatement            gui=none            guifg=#c0c090       guibg=bg
hi perlStatementControl     gui=none            guifg=#dcdb6b       guibg=bg
hi perlStatementFiledesc    gui=none            guifg=#a2c090       guibg=bg
hi perlStatementHash        gui=none            guifg=brown         guibg=bg
hi perlStatementInclude     gui=none            guifg=darkyellow    guibg=bg
hi perlStatementNew         gui=underline       guifg=darkyellow    guibg=bg
hi perlStatementSub         gui=none            guifg=gray30        guibg=bg
hi perlStringStartEnd       gui=italic          guifg=#dc966b       guibg=bg
hi perlVarNotInMatches      gui=none            guifg=#915555       guibg=bg
hi perlVarPlain             gui=none            guifg=#74c5c6       guibg=bg
hi perlVarPlain2            gui=none            guifg=#74c6a8       guibg=bg
hi perlVarSimpleMember      gui=none            guifg=#c0c090       guibg=bg
hi perlVarSimpleMemberName  gui=none            guifg=grey70        guibg=bg

" vim: sw=2
