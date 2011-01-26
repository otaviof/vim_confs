"
" -- Vim's Colorscheme --
"
"  Maintainer: Otavio Fernandes <otaviof@gmail.com>
" Last Change: 2011/01/22
"     Version: 1.1.0
"
" vim: ts=4
"

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "no_quarter"

"
" Vim Colors (Default Options)
"

hi Normal                   gui=none        guifg=gray90        guibg=gray12

hi Comment                  gui=none        guifg=#647bcf       guibg=bg
hi Constant                 gui=none        guifg=#b07050       guibg=bg
hi Cursor                   gui=none        guifg=NONE          guibg=darkorange
hi CursorIM                 gui=none        guifg=NONE          guibg=#8800ff
hi CursorLine               gui=none        guifg=NONE          guibg=gray20
hi DiffAdd                  gui=none        guifg=#a0d0ff       guibg=#0020a0
hi DiffChange               gui=none        guifg=#e03870       guibg=#601830
hi DiffDelete               gui=none        guifg=#a0d0ff       guibg=#0020a0
hi DiffText                 gui=none        guifg=#ff78f0       guibg=#a02860
hi Directory                gui=none        guifg=lightmagenta  guibg=bg
hi Error                    gui=bold        guifg=white         guibg=red
hi ErrorMsg                 gui=bold        guifg=#ffa0ff       guibg=bg
hi FoldColumn               gui=none        guifg=darkslategray guibg=bg
hi Folded                   gui=none        guifg=#40f0f0       guibg=#006090
hi iCursor                  gui=none        guifg=fg            guibg=green
hi Identifier               gui=none        guifg=#90c0c0       guibg=bg
hi Ignore                   gui=none        guifg=bg            guibg=bg
hi IncSearch                gui=underline   guifg=#80ffff       guibg=#0060c0
hi LineNr                   gui=none        guifg=gray30        guibg=gray10
hi ModeMsg                  gui=bold        guifg=#a0d0ff       guibg=bg
hi MoreMsg                  gui=none        guifg=lightred      guibg=bg
hi NonText                  gui=none        guifg=gray30        guibg=bg
hi OverLength               gui=none        guifg=fg            guibg=gray30
hi Operator                 gui=none        guifg=#c0c090       guibg=bg
hi PreProc                  gui=none        guifg=#c090c0       guibg=bg
hi Question                 gui=bold        guifg=#e8e800       guibg=bg
hi Search                   gui=none        guifg=bg            guibg=gray60
hi SignColumn               gui=none        guifg=darkyellow    guibg=bg
hi Special                  gui=none        guifg=#c090c0       guibg=bg
hi SpecialKey               gui=none        guifg=darkslategray guibg=bg
hi Statement                gui=none        guifg=#c0c090       guibg=bg
hi StatusLine               gui=italic      guifg=#c0c090       guibg=gray30
hi StatusLineNC             gui=none        guifg=gray60        guibg=gray20
hi Title                    gui=none        guifg=darkyellow    guibg=bg
hi Todo                     gui=bold        guifg=#ff80d0       guibg=bg
hi Type                     gui=none        guifg=#60f0a8       guibg=bg
hi Underlined               gui=underline   guifg=#707070       guibg=bg
hi VertSplit                gui=none        guifg=darkslategray guibg=gray15
hi Visual                   gui=none        guifg=#b0ffb0       guibg=#008000
hi VisualNOS                gui=none        guifg=#ffe8c8       guibg=#c06800
hi WarningMsg               gui=bold        guifg=#ffa0ff       guibg=bg
hi WildMenu                 gui=none        guifg=#000000       guibg=#abac84
hi htmlTagName              gui=none        guifg=grey70        guibg=bg
hi lCursor                  gui=none        guifg=#ffffff       guibg=#8800ff

"
" Other tools
"

hi MyTagListFileName        gui=underline   guifg=fg            guibg=bg
hi Pmenu                    gui=none        guifg=grey80        guibg=darkred
hi PmenuSbar                gui=none        guifg=green         guibg=green
hi PmenuSel                 gui=bold        guifg=orange        guibg=grey30
hi PmenuThumb               gui=none        guifg=grey30        guibg=bg
hi TagListTagName           gui=underline   guifg=fg            guibg=bg
hi RightMargin              gui=none        guifg=fg            guibg=#453030

"
" Perl's
"

hi perlControl              gui=none        guifg=#c0c090       guibg=bg
hi perlFunctionName         gui=none        guifg=white         guibg=bg
hi perlIdentifier           gui=none        guifg=gray75        guibg=bg
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

"
" Python
"

hi pythonDecorator          gui=bold        guifg=#3b3b3b       guibg=bg
hi pythonDot                gui=NONE        guifg=grey          guibg=bg
hi pythonOperator           gui=NONE        guifg=#ffdf87       guibg=bg
hi pythonNumber             gui=none        guifg=#5faf5f       guibg=bg
hi pythonException          gui=NONE        guifg=#dfaf5f       guibg=bg
hi pythonRepeat             gui=NONE        guifg=#ffff87       guibg=bg
hi pythonString             gui=NONE        guifg=#af5f5f       guibg=bg

" -- Python ------------------------------------------------------------------
" pythonBinError pythonConditional pythonError pythonFunction
" pythonOctNumber pythonRun pythonUniRawEscapeError pythonBinNumber
" pythonEscape pythonHexError pythonSpaceError pythonSync
" pythonUniRawString pythonBuiltinFunc pythonDocTest pythonEscapeError
" pythonHexNumber pythonPreCondit pythonStatement pythonTodo
" pythonUniString pythonBuiltinObj pythonDocTest2 pythonExClass
" pythonIndentError pythonRawEscape pythonStrFormat pythonUniEscape
" pythonCoding pythonRawString pythonStrFormatting pythonUniEscapeError
" pythonComment pythonDottedName pythonFloat pythonOctError
" pythonStrTemplate pythonUniRawEscape
" ----------------------------------------------------------------------------

" -- Perl --------------------------------------------------------------------
" perlCharacter perlConditional perlFiledescRead perlFiledescStatement
" perlFloat perlFormatField perlFormatName perlFunctionPRef perlHereDoc
" perlInclude perlList perlMethod perlMisc perlPackageRef perlSpecialAscii
" perlSpecialDollar perlSpecialStringU perlStatementFiles perlStatementFlow
" perlStatementIOfunc perlStatementIPC perlStatementList perlStatementMisc
" perlStatementNetwork perlStatementNumeric perlStatementPackage
" perlStatementProc perlStatementPword perlStatementRegexp perlStatementScalar
" perlStatementScope perlStatementSocket perlStatementStorage perlStatementTime
" perlStatementVector perlStorageClass perlString perlStringUnexpanded
" perlSubstitutionBracket perlSubstitutionCurly perlSubstitutionDQ
" perlSubstitutionHash perlSubstitutionPling perlSubstitutionSQ
" perlSubstitutionSlash perlTranslationBracket perlTranslationCurly
" perlTranslationHash perlTranslationSlash perlType perlVarSlash
" ----------------------------------------------------------------------------

" EOF
