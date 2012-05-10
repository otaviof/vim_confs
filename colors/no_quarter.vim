"
" -- Vim's Colorscheme --
"
"  Maintainer: Otavio Fernandes <otaviof@gmail.com>
" Last Change: 2012/01/29
"     Version: 1.2
"
"vim: ts=4,sw=4
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

hi Normal                   gui=none        guifg=gray95        guibg=#151515

hi Comment                  gui=none        guifg=#8B97E4       guibg=bg
hi Constant                 gui=none        guifg=#D77A7A       guibg=bg
hi DiffAdd                  gui=none        guifg=#a0d0ff       guibg=#0020a0
hi DiffChange               gui=none        guifg=#e03870       guibg=#601830
hi DiffDelete               gui=none        guifg=#a0d0ff       guibg=#0020a0
hi DiffText                 gui=none        guifg=#ff78f0       guibg=#a02860
hi Directory                gui=none        guifg=lightmagenta  guibg=bg
hi Error                    gui=bold        guifg=white         guibg=red
hi ErrorMsg                 gui=bold        guifg=#ffa0ff       guibg=bg
hi FoldColumn               gui=none        guifg=darkslategray guibg=bg
hi Folded                   gui=none        guifg=#40f0f0       guibg=#006090
hi Identifier               gui=none        guifg=#90c0c0       guibg=bg
hi Ignore                   gui=none        guifg=gray60        guibg=bg
hi IncSearch                gui=underline   guifg=#80ffff       guibg=#0060c0
hi LineNr                   gui=none        guifg=gray45        guibg=gray20
hi ModeMsg                  gui=bold        guifg=#a0d0ff       guibg=bg
hi MoreMsg                  gui=none        guifg=lightred      guibg=bg
hi NonText                  gui=none        guifg=gray30        guibg=bg
hi Operator                 gui=none        guifg=#c0c090       guibg=bg
hi OverLength               gui=none        guifg=fg            guibg=gray30
hi PreProc                  gui=none        guifg=#c090c0       guibg=bg
hi Question                 gui=bold        guifg=#e8e800       guibg=bg
hi Search                   gui=none        guifg=bg            guibg=gray60
hi SignColumn               gui=none        guifg=darkyellow    guibg=bg
hi Special                  gui=none        guifg=#c090c0       guibg=bg
hi SpecialKey               gui=none        guifg=darkslategray guibg=bg
hi Statement                gui=none        guifg=#c0c090       guibg=bg
hi StatusLine               gui=underline   guifg=white         guibg=orangered3
hi StatusLineNC             gui=none        guifg=gray70        guibg=gray35
hi Title                    gui=none        guifg=darkyellow    guibg=bg
hi Todo                     gui=bold        guifg=#ff80d0       guibg=bg
hi Type                     gui=none        guifg=#60f0a8       guibg=bg
hi Underlined               gui=underline   guifg=#707070       guibg=bg
hi VertSplit                gui=none        guifg=darkslategray guibg=gray15
hi Visual                   gui=none        guifg=#b0ffb0       guibg=#008000
hi VisualNOS                gui=none        guifg=#ffe8c8       guibg=#c06800
hi WarningMsg               gui=bold        guifg=#ffa0ff       guibg=bg
hi WildMenu                 gui=none        guifg=#000000       guibg=#abac84
hi htmlTagName              gui=none        guifg=gray70        guibg=bg
hi lCursor                  gui=none        guifg=#ffffff       guibg=#8800ff

hi ColorColumn              gui=none                            guibg=gray5

"
" Cursor
"

hi Cursor                   gui=none        guifg=NONE          guibg=orangered1
hi CursorIM                 gui=none        guifg=NONE          guibg=#8800ff
hi CursorLine               gui=none        guifg=NONE          guibg=gray20
hi iCursor                  gui=none        guifg=fg            guibg=green


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
hi perlVarBlock2            gui=none        guifg=gray70        guibg=bg

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


"
" Python
"

hi pythonBuiltinFunc        gui=NONE        guifg=grey60        guibg=bg
hi pythonBuiltinObj         gui=NONE        guifg=lightgreen    guibg=bg
hi pythonDecorator          gui=NONE        guifg=orangered     guibg=bg
hi pythonDot                gui=NONE        guifg=grey          guibg=bg
hi pythonException          gui=NONE        guifg=#dfaf5f       guibg=bg
hi pythonFunction           gui=NONE        guifg=#AFCBAE       guibg=bg
hi pythonOperator           gui=NONE        guifg=#ffdf87       guibg=bg
hi pythonRepeat             gui=NONE        guifg=orangered     guibg=bg

hi link pythonString        Constant
hi link pythonNumber        Number
hi link pythonStatement     Statement

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

"
" Org-Mode
"
hi Org_Property_Value     ctermfg=13 guifg=pink
hi Org_Tag                ctermfg=9  guifg=lightgreen
hi Org_Drawer             ctermfg=13 guifg=pink
hi Org_Date               gui=underline cterm=underline ctermfg=13 guifg=magenta
hi Org_Star               ctermfg=8 guifg=#444444
hi Org_Table              ctermfg=13 guifg=#888888 guibg=bg
hi Org_Block              ctermfg=13 guifg=#555555
hi Org_Src_Block          ctermfg=13 guifg=gray80
hi Org_Config_Line        ctermfg=13 guifg=darkgray

" EOF
