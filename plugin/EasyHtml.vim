" File : EasyHtml.vim
" Last Change: 2002 Feb 18
" Maintainer: Gontran BAERTS <gbcreation@free.fr>
" Version: 0.5.1
"
" Please don't hesitate to correct my english :)
" Send corrections to <gbcreation@free.fr>
"
"-----------------------------------------------------------------------------
" Description: With EasyHtml, you no longer need to look for tags attributes,
" attributes values or CSS properties values while editing HTML files.
" EasyHtml let you select the right attribute or value by showing you an
" attributes/values list for the tag/attribute/CSS property under the cursor.
"
"-----------------------------------------------------------------------------
" To Enable: Normally, this file will reside in your plugins directory and be
" automatically sourced.  If not, you must manually source this file" using :
" source EasyHtml.vim
"
"-----------------------------------------------------------------------------
" Usage: Move the text cursor on the tag, attribute, or CSS property word
" then :
" 		- Press <F2> key to display attributes for the tag before/under the
" 		cursor
" 		- Press <F3> key to display values for the attribute before/under the
" 		cursor
" 		- Press <F4> ket to display values for the CSS Property befor/under
" 		the cursor
"
"
" In the EasyHtml buffer, use :
"
"       - h,j,k,l or <Left>,<Down>,<Up>,<Right> keys to change selected
"         item.
"       - <PageUp>/<PageDown> or <C-F>,<C-B> keys to scroll list one page
"         downward/forward.
"       - <Home> or <C-Home> to select the first item.
"       - <End> or <C-End> to select the last item.
"       - <ENTER> to add selected item WITHOUT exiting from items list.
"       - <S-ENTER> to add selected item AND exit from items list.
"       - q or <ESC> to exit without adding selected item.
"
" Deprecated attributes as declared by W3C are red highlighted, while right
" attributes are blue highlighted.
"
" Set g:easyHtmlSplitRight variable to 0 or 1 to open items list at left
" or right of current window. By default, use splitright setting.
"
" Set g:eh_singlequote variable to 0 (default) or 1 to use double or single
" quote when adding attributes (For example id="" or id='')
"
" Set g:eh_incsearch variable to 0 (default) or 1 to dis- or en-able
" incremental list search. This feature allows to select an item by typing its
" beginning. When this is enable, 'q', 'h', 'j', 'k' and 'l' keys aren't used
" to exit from list and to move highlighting. Use 'Q', '<Left>', '<Down>',
" '<Up>' and '<Right>' instead.
"
" Set g:eh_atfirstplace to 0 (default) or 1 to indicate if attributes must be
" added at the end or at the beginning of the tag.
"
" Useful mappings :
"   . d<F2> : delete tag before/under cursor
"   . d<F3> : delete attribute before/under cursor
"
"-----------------------------------------------------------------------------
" Updates:
" in version 0.5.1
" - No longer use of the modifiable option.
" 
" in version 0.5
" - Now use liblist.vim script to handle lists and genutils.vim script to
"   handle windows (Thanks to Hari Krishna Dara for this script).
"   Download them at
"   http://vim.sourceforge.net/scripts/script.php?script_id=166
"   and
"   http://vim.sourceforge.net/scripts/script.php?script_id=197
"   Make script smaller.
" - Mapping changed !
"   <F2> displays tag attributes
"   <F3> displays attributes values
"   <F4> displays CSS Properties values
"   <ENTER> no longer close list after item addition. Use <S-ENTER> to add and
"   exit from list.
" - More user friendly : you no longer need to move cursor exactly on the
"   keyword. Cursor may stay on '=', ':' or '"' signs just after keyword while
"   hitting <F2>, <F3> or <F4> keys.
"   For example,
"   . Tags : <img
"     Hitting <F2> key works while cursor is at '<' sign.
"   . Attributes : style=""
"     Hitting <F3> key works while cursor is at '=' or '"' signs.
"   . CSS properties : background-color:;
"     Hitting <F4> key works while cursor is at ':' or ';' signs.
" - New mappings :
"   . d<F2> : delete tag before/under cursor
"   . d<F3> : delete attribute before/under cursor
" - New g:eh_atfirstplace variable. See Usage section above.
" - Fix modifiable setting again
" - Fix syntax error for the "frame" attribute of <table> tag which causes
"   "border" attribute to not been seen in attributes list.
"
" in version 0.4.1
" - Fix infinite loop to find window when easyhtml buffer is hidden. Thanks to
"   Jonathon Merz who pointed out the bug and send me the patch.
"
" in version 0.4
" - Added values for the "style" attribute (CSS2 properties)
" - Added values for CSS2 properties
" - <PageUp> and <PageDown> are now usable to move highlight through the list
" - When adding a value for an attribute, current attribute value (if exists)
"   is replaced by the selected one, except for "style" attribute for which
"   values are append
" - Set g:eh_singlequote variable to 0 or 1 to use double or single quote when
"   adding attributes (For example id="" or id='')
"
" in version 0.3
"  - Attributes list updated
"  - Don't display attributes list for closing tags
"  - Now, display values list when hitting <F3> with cursor on attribute word
"    (for some attributes only).
"
" in version 0.2.1
" - Fix global modifiable setting instead of local
"
" in version 0.2
" - Attributes list is now alphabetically sorted
" - Hitting <F3> allows to display attributes list in Insert mode too
" - Allows to select an attribute by incremental search :-)
"   For example, with <body> tag, typing "onk" (normal mode) in the attributes
"   list buffer automatically select "onkeydown" attribute. Use backspace
"   (<BS>) to remove characters. This behavior is enable by setting
"   g:eh_incsearch variable to 1. Warning : when incremental attribute search
"   is on, 'q', 'h', 'j', 'k' and 'l' keys aren't used to exit from list and
"   to move highlighting. Use 'Q', '<Left>', '<Down>', '<Up>' and '<Right>'
"   instead.
" - Check for attributes list already opened, and reuse it
"
" in version 0.1
" - First version

" Has this already been loaded ?
if exists("loaded_easyhtml")
       fini
en
let loaded_easyhtml=1

if !exists("g:easyHtmlSplitRight")
	let g:easyHtmlSplitRight = &spr
en

if !exists("g:eh_incsearch")
	let g:eh_incsearch = 0
en

if !exists("g:eh_singlequote")
	let g:eh_singlequote = 0
en

if !exists("g:eh_atfirstplace")
	let g:eh_atfirstplace = 0
en

" **
" Mappings:
" **
" Tag deletion
nm d<F2> lF<df>
" Attribut deletion
nm d<F3> lF d2f"
" Left move attribut
nm <C-S-Left> d<F3>
" Right move attribut
nm <C-S-Right> d<F3>/ \\|><cr>:nohl<cr>P
" Tag attributes list
nm <F2> :cal LaunchEasyHtml('<')<cr>
im <F2> <esc><F2>a
" Attributes values list
nm <F3> :cal LaunchEasyHtml('\s')<cr>
im <F3> <esc><F3>a
" Style attribut values list
nm <F4> :cal LaunchEasyHtml('\(\s\\|"\\|;\)[a-zA-Z-]\+:')<cr>
im <F4> <esc><F4>a

"**
" Script Variables:
"**
let s:srch = ""
let s:maxAttrLength = 0
let s:currentPos = 2
let s:itemAdded = 0
" HTML tags and their attributs
let s:coreattrs = "id=\"\" class=\"\" style=\"\" title=\"\""
let s:i18n = "lang=\"\" dir=\"\""
let s:events = "onclick=\"\" ondblclick=\"\" onmousedown=\"\" onmouseup=\"\" onmouseover=\"\" onmousemove=\"\" onmouseout=\"\" onkeypress=\"\" onkeydown=\"\" onkeyup=\"\""
let s:cellhalign = "align=\"\" char=\"\" charoff=\"\""
let s:cellvalign = "valign=\"\""
let s:attrs = "%coreattrs %i18n %events"
let s:HTMLTags = "<a %attrs charset=\"\" target=\"\" type=\"\" name=\"\" href=\"\" hreflang=\"\" rel=\"\" rev=\"\" accesskey=\"\" shape=\"\" coords=\"\" tabindex=\"\" onfocus=\"\" onblur=\"\""
	\ . ",<abbr %attrs"
	\ . ",<acronym %attrs"
	\ . ",<address %attrs"
	\ . ",<applet %coreattrs alt=\"\" align-D=\"\"-D hspace-D=\"\" vspace-D=\"\" codebase-D=\"\" code-D=\"\" name-D=\"\" archive-D=\"\" object-D=\"\" width-D=\"\" height-D=\"\""
	\ . ",<area %attrs shape=\"\" coords=\"\" nohref name=\"\" alt=\"\" href=\"\" tabindex=\"\" accesskey=\"\" onfocus=\"\" onblur=\"\" target=\"\""
	\ . ",<b %attrs"
	\ . ",<base href=\"\" target=\"\""
	\ . ",&lt;basefont size-D=\"\" color-D=\"\" face-D=\"\""
	\ . ",<bdo %coreattrs lang=\"\" dir=\"\""
	\ . ",<big %attrs"
	\ . ",<blockquote %attrs cite=\"\""
	\ . ",<body %attrs onload=\"\" onunload=\"\" background-D=\"\" bgcolor-D=\"\" text-D=\"\" link-D=\"\" vlink-D=\"\" alink-D=\"\""
	\ . ",<br %coreattrs clear-D=\"\""
	\ . ",<button %attrs name=\"\" value=\"\" type=\"\" disabled tabindex=\"\" accesskey=\"\" onfocus=\"\" onblur=\"\""
	\ . ",<caption %attrs align-D=\"\""
	\ . ",<center %attrs"
	\ . ",<cite %attrs"
	\ . ",<code %attrs"
	\ . ",<col %attrs span=\"\" width=\"\" %cellhalign %cellvalign"
	\ . ",<colgroup %attrs span=\"\" width=\"\" %cellhalign %cellvalign"
	\ . ",<dd %attrs"
	\ . ",<del %attrs cite=\"\" datetime=\"\""
	\ . ",<dfn %attrs"
	\ . ",<dir %attrs compact-D"
	\ . ",<div %attrs align-D=\"\""
	\ . ",<dl %attrs compact-D"
	\ . ",<dt %attrs"
	\ . ",<em %attrs"
	\ . ",<fieldset %attrs"
	\ . ",<font %coreattrs %i18n size-D=\"\"-D color-D=\"\" face-D=\"\""
	\ . ",<form %attrs action=\"\" method=\"\" enctype=\"\" name=\"\" onsubmit=\"\" onreset=\"\" accept=\"\" accept-charset=\"\" target=\"\""
	\ . ",<frame %coreattrs longdesc=\"\" name=\"\" src=\"\" frameborder=\"\" marginwidth=\"\" marginheight=\"\" noresize scrolling=\"\""
	\ . ",<frameset %coreattrs rows=\"\" cols=\"\" onload=\"\" onunload=\"\""
	\ . ",<h1 %attrs align-D=\"\""
	\ . ",<h2 %attrs align-D=\"\""
	\ . ",<h3 %attrs align-D=\"\""
	\ . ",<h4 %attrs align-D=\"\""
	\ . ",<h5 %attrs align-D=\"\""
	\ . ",<h6 %attrs align-D=\"\""
	\ . ",<head %i18n profile=\"\""
	\ . ",<hr %attrs align-D=\"\" noshade-D size-D=\"\" width-D=\"\""
	\ . ",<html %i18n version-D=\"\""
	\ . ",<i %attrs"
	\ . ",<iframe %coreattrs longdesc=\"\" name=\"\" src=\"\" frameborder=\"\" marginwidth=\"\" marginheight=\"\" scrolling=\"\" align-D=\"\" height=\"\" width=\"\""
	\ . ",<img %attrs src=\"\" alt=\"\" longdesc=\"\" name=\"\" height=\"\" width=\"\" usemap=\"\" ismap align-D=\"\" border-D=\"\" hspace-D=\"\" vspace-D=\"\""
	\ . ",<input %attrs type=\"\" name=\"\" value=\"\" checked disabled readonly size=\"\" maxlength=\"\" src=\"\" alt=\"\" usemap=\"\" ismap tabindex=\"\" accesskey=\"\" onfocus=\"\" onblur=\"\" onselect=\"\" onchange=\"\" accept=\"\" align-D=\"\""
	\ . ",<ins %attrs cite=\"\" datetime=\"\""
	\ . ",<isindex %coreattrs %i18n prompt-D=\"\""
	\ . ",<kbd %attrs"
	\ . ",<label %attrs for=\"\" accesskey=\"\" onfocus=\"\" onblur=\"\""
	\ . ",<legend %attrs accesskey=\"\" align-D=\"\""
	\ . ",<li %attrs type-D=\"\" value-D=\"\""
	\ . ",<link %attrs charset=\"\" href=\"\" hreflang=\"\" type=\"\" rel=\"\" rev=\"\" media=\"\" target=\"\""
	\ . ",<map %attrs name=\"\""
	\ . ",<menu %attrs compact-D"
	\ . ",<meta %i18n http-equiv=\"\" name=\"\" content=\"\" scheme=\"\""
	\ . ",<noframes %attrs"
	\ . ",<noscript %attrs"
	\ . ",<object %attrs declare classid=\"\" codebase=\"\" data=\"\" type=\"\" codetype=\"\" archive=\"\" standby=\"\" height=\"\" width=\"\" usemap=\"\" name=\"\" tabindex=\"\" align-D=\"\" border-D=\"\" hspace-D=\"\" vspace-D=\"\""
	\ . ",<ol %attrs type-D=\"\" start-D=\"\" compact-D"
	\ . ",<optgroup %attrs disabled label=\"\""
	\ . ",<option %attrs selected disabled label=\"\" value=\"\""
	\ . ",<p %attrs align-D=\"\""
	\ . ",<param id=\"\" name=\"\" value=\"\" valuetype=\"\" type=\"\""
	\ . ",<pre %attrs width-D=\"\""
	\ . ",<q %attrs cite=\"\""
	\ . ",<s %attrs"
	\ . ",<samp %attrs"
	\ . ",<script charset=\"\" type=\"\" src=\"\" defer language-D=\"\""
	\ . ",<select %attrs name=\"\" size=\"\" multiple disabled tabindex=\"\" onfocus=\"\" onblur=\"\" onchange=\"\""
	\ . ",<small %attrs"
	\ . ",<span %attrs"
	\ . ",<strike %attrs"
	\ . ",<strong %attrs"
	\ . ",<style %i18n type=\"\" media=\"\" title=\"\""
	\ . ",<sub %attrs"
	\ . ",<sup %attrs"
	\ . ",<table %attrs summary=\"\" width=\"\" border=\"\" frame=\"\" rules=\"\" cellspacing=\"\" cellpadding=\"\" align-D=\"\" bgcolor-D=\"\""
	\ . ",<tbody %attrs %cellhalign %cellvalign"
	\ . ",<td %attrs abbr=\"\" axis=\"\" headers=\"\" scope=\"\" rowspan=\"\" colspan=\"\" %cellhalign %cellvalign nowrap-D width-D=\"\" height-D=\"\" bgcolor-D=\"\""
	\ . ",<textarea %attrs name=\"\" rows=\"\" cols=\"\" disabled readonly tabindex=\"\" accesskey=\"\" onfocus=\"\" onblur=\"\" onselect=\"\" onchange=\"\""
	\ . ",<tfoot %attrs %cellhalign %cellvalign"
	\ . ",<th %attrs abbr=\"\" axis=\"\" headers=\"\" scope=\"\" rowspan=\"\" colspan=\"\" %cellhalign %cellvalign nowrap-D width-D=\"\" height-D=\"\" bgcolor-D=\"\""
	\ . ",<thead %attrs %cellhalign %cellvalign"
	\ . ",<title %i18n"
	\ . ",<tr %attrs %cellhalign %cellvalign bgcolor-D=\"\""
	\ . ",<tt %attrs"
	\ . ",<u %attrs"
	\ . ",<ul %attrs type-D=\"\" compact-D"
	\ . ",<var %attrs"
" Attributes and their values
let s:TagsAttributs = "align=\" bottom center char justify left middle right top"
	\ . ",alink=\" Aqua Black Blue Fuchsia Gray Green Lime Maroon Navy Olive Purple Red Silver Teal White Yellow"
	\ . ",bgcolor=\" Black Silver Gray White Maroon Red Purple Fuchsia Green Lime Olive Yellow Navy Blue Teal Aqua"
	\ . ",charset=\" ISO-8859-1 SHIFT_JIS UTF-8"
	\ . ",clear=\" all none left right"
	\ . ",color=\" Aqua Black Blue Fuchsia Gray Green Lime Maroon Navy Olive Purple Red Silver Teal White Yellow"
	\ . ",content=\" text/css"
	\ . ",dir=\" ltr rtl"
	\ . ",frameborder=\" 0 1"
	\ . ",frame=\" above below border box hsides lhs rhs void vsides"
	\ . ",hreflang=\" aa ab af am ar as ay az ba be bg bh bi bn bo br ca co cs cy da de dz el en eo es et eu fa fi fj fo fr fy ga gd gl gn gu ha he hi hr hu hy ia id ie ik is it iu ja jv ka kk kl km kn ko ks ku ky la ln lo lt lv mg mi mk ml mn mo mr ms mt my na ne nl no oc om or pa pl ps pt qu rm rn ro ru rw sa sd sg sh si sk sl sm sn so sq sr ss st su sv sw ta te tg th ti tk tl tn to tr ts tt tw ug uk ur uz vi vo wo xh yi yo za zh zu"
	\ . ",http-equiv=\" Content-Script-Type Content-Style-Type Content-Type Expires PICS-Label"
	\ . ",lang=\" aa ab af am ar as ay az ba be bg bh bi bn bo br ca co cs cy da de dz el en eo es et eu fa fi fj fo fr fy ga gd gl gn gu ha he hi hr hu hy ia id ie ik is it iu ja jv ka kk kl km kn ko ks ku ky la ln lo lt lv mg mi mk ml mn mo mr ms mt my na ne nl no oc om or pa pl ps pt qu rm rn ro ru rw sa sd sg sh si sk sl sm sn so sq sr ss st su sv sw ta te tg th ti tk tl tn to tr ts tt tw ug uk ur uz vi vo wo xh yi yo za zh zu"
	\ . ",link=\" Aqua Black Blue Fuchsia Gray Green Lime Maroon Navy Olive Purple Red Silver Teal White Yellow"
	\ . ",media=\" all aural braille handheld print projection screen tty tv"
	\ . ",method=\" get post"
	\ . ",name=\" Author copyright date keywords"
	\ . ",rel=\" Alternate Appendix Bookmark Chapter Contents Copyright Glossary Help Index Made Next Prev Section Start StyleSheet Subsection"
	\ . ",rev=\" Alternate Appendix Bookmark Chapter Contents Copyright Glossary Help Index Made Next Prev Section Start StyleSheet Subsection"
	\ . ",rules=\" all cols groups none rows"
	\ . ",scope=\" col colgroup row rowgroup"
	\ . ",scrolling=\" auto no yes"
	\ . ",shape=\" circle default poly rect"
	\ . ",style=\" azimuth:; background:; background-attachment:; background-color:; background-image:; background-position:; background-repeat:; border:; border-bottom:; border-bottom-color:; border-bottom-style:; border-bottom-width:; border-collapse:; border-color:; border-left:; border-left-color:; border-left-style:; border-left-width:; border-right:; border-right-color:; border-right-style:; border-right-width:; border-spacing:; border-style:; border-top:; border-top-color:; border-top-style:; border-top-width:; border-width:; bottom:; caption-side:; clear:; clip:; color:; content:; counter-increment:; counter-reset:; cue:; cue-after:; cue-before:; cursor:; direction:; display:; elevation:; empty-cells:; float:; font:; font-family:; font-size:; font-size-adjust:; font-stretch:; font-style:; font-variant:; font-weight:; height:; left:; letter-spacing:; line-height:; list-style:; list-style-image:; list-style-position:; list-style-type:; margin:; margin-bottom:; margin-left:; margin-right:; margin-top:; marker-offset:; marks:; max-height:; max-width:; min-height:; min-width:; orphans:; outline:; outline-color:; outline-style:; outline-width:; overflow:; padding:; padding-bottom:; padding-left:; padding-right:; padding-top:; page:; page-break-after:; page-break-before:; page-break-inside:; pause:; pause-after:; pause-before:; pitch:; pitch-range:; play-during:; position:; quotes:; richness:; right:; size:; speak:; speak-header:; speak-numeral:; speak-punctuation:; speech-rate:; stress:; table-layout:; text-align:; text-decoration:; text-indent:; text-shadow:; text-transform:; top:; unicode-bidi:; vertical-align:; visibility:; voice-family:; volume:; white-space:; widows:; width:; word-spacing:; z-index:;"
	\ . ",target=\" _blank _parent _self _top"
	\ . ",text=\" Aqua Black Blue Fuchsia Gray Green Lime Maroon Navy Olive Purple Red Silver Teal White Yellow"
	\ . ",type=\" 1 a A application/java button checkbox circle disc file hidden i I image image/jpeg model/vrml password radio reset square submit text text/css text/html text/javascript video/quicktime"
	\ . ",valign=\" baseline bottom middle top"
	\ . ",valuetype=\" data object ref"
	\ . ",vlink=\" Aqua Black Blue Fuchsia Gray Green Lime Maroon Navy Olive Purple Red Silver Teal White Yellow"
" CSS properties and their values
let s:angle = "deg grad rad"
let s:color = "# ActiveBorder ActiveCaption AppWorkspace Background ButtonFace ButtonHighlight ButtonShadow ButtonText CaptionText GrayText Highlight HighlightText InactiveBorder InactiveCaption InactiveCaptionText InfoBackground InfoText Menu MenuText rgb() Scrollbar ThreeDDarkShadow ThreeDFace ThreeDHighlight ThreeDLightShadow ThreeDShadow Window WindowFrame WindowText"
let s:length = "cm em ex in mm pc pt px"
let s:borderstyle = "dashed dotted double groove hidden inset none outset ridge solid"
let s:borderwidth = "%length medium thick thin"
let s:genericfamily = "cursive fantasy monospace sans-serif serif"
let s:absolutesize = "large medium small x-large x-small xx-large xx-small"
let s:relativesize = "larger smaller"
let s:marginwidth = "auto %length"
let s:time = "ms s"
let s:frequency = "Hz kHz"
let s:genericvoice = "child female male"
let s:CSSProperties = "azimuth: %angle behind center center-left center-right far-left far-right inherit left left-side leftwards right right-side rightwards,"
	\ . "background: bottom left center %color fixed inherit %length none no-repeat repeat repeat-x repeat-y right scroll top transparent url(),"
	\ . "background-attachment: fixed inherit scroll,"
	\ . "background-color: %color inherit transparent,"
	\ . "background-image: inherit none url(),"
	\ . "background-position: bottomleft center inherit %length right top,"
	\ . "background-repeat: inherit no-repeat repeat repeat-x repeat-y,"
	\ . "border: %borderstyle %borderwidth %color inherit,"
	\ . "border-collapse: collapse inherit separate,"
	\ . "border-color: %color inherit transparent,"
	\ . "border-spacing: inherit %length,"
	\ . "border-style: %borderstyle inherit,"
	\ . "border-top: %borderstyle %borderwidth %color inherit,"
	\ . "border-right: %borderstyle %borderwidth %color inherit,"
	\ . "border-bottom: %borderstyle %borderwidth %color inherit,"
	\ . "border-left: %borderstyle %borderwidth %color inherit,"
	\ . "border-top-color: %color inherit,"
	\ . "border-right-color: %color inherit,"
	\ . "border-bottom-color: %color inherit,"
	\ . "border-left-color: %color inherit,"
	\ . "border-top-style: %borderstyle inherit,"
	\ . "border-right-style: %borderstyle inherit,"
	\ . "border-bottom-style: %borderstyle inherit,"
	\ . "border-left-style: %borderstyle inherit,"
	\ . "border-top-width: %borderwidth inherit,"
	\ . "border-right-width: %borderwidth inherit,"
	\ . "border-bottom-width: %borderwidth inherit,"
	\ . "border-left-width: %borderwidth inherit,"
	\ . "border-width: %borderwidth inherit,"
	\ . "bottom: auto inherit %length,"
	\ . "caption-side: bottom inherit left right top,"
	\ . "clear: both inherit left none right,"
	\ . "clip: auto inherit rect(),"
	\ . "color: %color inherit,"
	\ . "content: attr(X) close-quote counter() inherit no-close-quote no-open-quote open-quote url(),"
	\ . "counter-increment: inherit none,"
	\ . "counter-reset: inherit none,"
	\ . "cue: inherit none url(),"
	\ . "cue-after: inherit none url(),"
	\ . "cue-before: inherit none url(),"
	\ . "cursor: auto crosshair default e-resize help inherit move ne-resize n-resize nw-resize pointer se-resize s-resize sw-resize url() wait w-resizetext,"
	\ . "direction: inherit ltr rtl,"
	\ . "display: block compact inherit inline inline-table list-item marker none run-in table table-caption table-cell table-column table-column-group table-footer-group table-header-group table-row table-row-group,"
	\ . "elevation: above %angle below higher inherit level lower,"
	\ . "empty-cells: hide inherit show,"
	\ . "float: inherit left none right,"
	\ . "font: 100 200 300 400 500 600 700 800 900 %absolutesize bold bolder caption %genericfamily icon inherit italic %length lighter menu message-box normal oblique %relativesize small-caps small-caption status-bar,"
	\ . "font-family: %genericfamily inherit,"
	\ . "font-size: %absolutesize inherit %length %relativesize,"
	\ . "font-size-adjust: inherit none,"
	\ . "font-stretch: condensed expanded extra-condensed extra-expanded inherit narrower normal semi-condensed semi-expanded ultra-condensed ultra-expanded wider,"
	\ . "font-style: inherit italic normal oblique,"
	\ . "font-variant: inherit normal small-caps,"
	\ . "font-weight: 100 200 300 400 500 600 700 800 900 bold bolder inherit lighter normal,"
	\ . "height: auto inherit %length,"
	\ . "left: auto inherit %length,"
	\ . "letter-spacing: inherit %length normal,"
	\ . "line-height: inherit %length normal,"
	\ . "list-style: armenian circle cjk-ideographic decimal decimal-leading-zero disc georgian hebrew hiragana hiragana-iroha inherit inside katakana katakana-iroha lower-alpha lower-greek lower-latin lower-roman none outside square upper-alpha upper-latin upper-roman url(),"
	\ . "list-style-image: inherit none url(),"
	\ . "list-style-position: inherit inside outside,"
	\ . "list-style-type: armenian circle cjk-ideographic decimal decimal-leading-zero disc georgian hebrew hiragana hiragana-iroha inherit katakana katakana-iroha lower-alpha lower-greek lower-latin lower-roman none square upper-alpha upper-latin upper-roman,"
	\ . "margin: inherit %marginwidth,"
	\ . "margin-top: inherit %marginwidth,"
	\ . "margin-right: inherit %marginwidth,"
	\ . "margin-bottom: inherit %marginwidth,"
	\ . "margin-left: inherit %marginwidth,"
	\ . "marker-offset: auto inherit %length,"
	\ . "marks: crop cross inherit none,"
	\ . "max-height: inherit %length none,"
	\ . "max-width: inherit %length none,"
	\ . "min-height: inherit %length,"
	\ . "min-width: inherit %length,"
	\ . "orphans: inherit,"
	\ . "outline: inherit %color invert %borderstyle %borderwidth,"
	\ . "outline-color: %color inherit invert,"
	\ . "outline-style: %borderstyle inherit,"
	\ . "outline-width: %borderwidth inherit,"
	\ . "overflow: auto hidden inherit scroll visible,"
	\ . "padding: inherit %length,"
	\ . "padding-top: inherit %length,"
	\ . "padding-right: inherit %length,"
	\ . "padding-bottom: inherit %length,"
	\ . "padding-left: inherit %length,"
	\ . "page: auto,"
	\ . "page-break-after: always auto avoid inherit left right,"
	\ . "page-break-before: always auto avoid inherit left right,"
	\ . "page-break-inside: auto avoid inherit,"
	\ . "pause: inherit %time,"
	\ . "pause-after: inherit %time,"
	\ . "pause-before: inherit %time,"
	\ . "pitch: %frequency high inherit low medium x-high x-low,"
	\ . "pitch-range: inherit,"
	\ . "play-during: auto inherit mix none repeat url(),"
	\ . "position: absolute fixed inherit relative static,"
	\ . "quotes: inherit none,"
	\ . "richness: inherit,"
	\ . "right: auto inherit %length,"
	\ . "size: auto inherit landscape %length portrait,"
	\ . "speak: inherit none normal spell-out,"
	\ . "speak-header: always inherit once,"
	\ . "speak-numeral: continuous digits inherit,"
	\ . "speak-punctuation: code inherit none,"
	\ . "speech-rate: fast faster inherit medium slow slower x-fast x-slow,"
	\ . "stress: inherit,"
	\ . "table-layout: auto fixed inherit,"
	\ . "text-align: center inherit justify left right,"
	\ . "text-decoration: blink inherit line-through none overline underline,"
	\ . "text-indent: inherit %length,"
	\ . "text-shadow: %color inherit %length none,"
	\ . "text-transform: capitalize inherit lowercase none uppercase,"
	\ . "top: auto inherit %length,"
	\ . "unicode-bidi: bidi-override embed inherit normal,"
	\ . "vertical-align: baseline bottom inherit %length middle sub super text-bottom text-top top,"
	\ . "visibility: collapse hidden inherit visible,"
	\ . "voice-family: %genericvoice inherit,"
	\ . "volume: inherit loud medium silent soft x-loud x-soft,"
	\ . "white-space: inherit normal nowrap pre,"
	\ . "widows: inherit,"
	\ . "width: auto inherit %length,"
	\ . "word-spacing: inherit %length normal,"
	\ . "z-index: auto inherit"

"**
" LaunchEasyHtml:
" Search if there are attributs for word under cursor, and display them in a
" new buffer.
"**
fu! LaunchEasyHtml( pat )
	" Save cursor position
	let s:eh_curLine = line(".")
	let s:eh_curCol  = virtcol(".")

	" Search keyword
	norm l
	cal search(a:pat,"bW")

	" Look for attributs for the current word
	cal s:SearchAttributes()
	" If the longest attribut length is 0, there is no attribut for the
	" current word
	if s:maxAttrLength == 0
		echoh ErrorMsg
		ec "EasyHtml : No result found for ".expand("<cword>")."."
		echoh NONE
		exe s:eh_curLine
		exe "norm ".s:eh_curCol."|"
		retu
	en

	" Is there an attributes list already running and is it in a window?
	let BufNr = bufnr( '--\ EasyHtml\ --' )
	if BufNr != -1 && bufwinnr(BufNr) != -1
		let CurBufNr = bufnr("%")
		wh CurBufNr != BufNr
			winc w
			let CurBufNr = bufnr("%")
		endw
		let BufNr = bufnr( '--\ EasyHtml\ --' )
	el
		" Save the user's settings for splitright
		let savesplitright = &spr
		" Configure vertical splitting side
		let &spr = g:easyHtmlSplitRight
		" Open new vertical window with right size
		"exe s:maxAttrLength . 'vnew --\ EasyHtml\ --'
		if s:maxAttrLength < &wiw
			let s:maxAttrLength = &wiw
		en
		exe s:maxAttrLength . 'vnew --\ EasyHtml\ --'
		" Restore user settings
		let &spr = savesplitright
		" Turn off the swapfile, set the buffer type so that it won't get
		" written, and so that it will get deleted when it gets hidden.
		"setl modifiable
		setl noswapfile
		setl buftype=nowrite
		setl bufhidden=delete
		setl nonumber
		" Don't wrap around long lines
		setl nowrap
		" No need for any insertmode abbreviations, since we don't allow
		" insertions anyway!
		iabc <buffer>
		" Highlighting
		sy match selectedAttribut /^<.*>$/
		sy match deprecatedAttribut /^(.*)$/
		sy match hiddenX /X/
		hi selectedAttribut guibg=lightblue guifg=black
		hi deprecatedAttribut guibg=lightred guifg=black
		let color= s:GetBgColor()
		if color != ""
			exe "hi hiddenX guibg=" . color . " guifg=" . color
		en

		" Set up mappings for this buffer
		nn <buffer> <Left> :cal <SID>MoveSelect( line(".")-1 )<CR>
		nn <buffer> <Up> :cal <SID>MoveSelect( line(".")-1 )<CR>
		nn <buffer> <Right> :cal <SID>MoveSelect( line(".")+1 )<CR>
		nn <buffer> <Down> :cal <SID>MoveSelect( line(".")+1 )<CR>
		nn <buffer> <PageUp> :cal <SID>PageUp()<cr>
		nn <buffer> <PageDown> :cal <SID>PageDown()<cr>
		nn <buffer> <C-Home> :cal <SID>MoveSelect( 1 )<cr>
		nn <buffer> <C-End> :cal <SID>MoveSelect( line("$") )<cr>
		nn <buffer> <Home> :cal <SID>MoveSelect( 1 )<cr>
		nn <buffer> <End> :cal <SID>MoveSelect( line("$") )<cr>
		nn <buffer> <cr> :cal <SID>AddItem()<cr>
		nn <buffer> <S-cr> :cal <SID>AddItem() \| cal <SID>CloseWindow()<cr>
		nn <buffer> <2-LeftMouse> :cal <SID>AddItem()<cr>
		nn <buffer> <esc> :cal <SID>CloseWindow()<cr>

		" If incremental search required, initialize it
		if( g:eh_incsearch == 1 )
			nn <buffer> Q :cal <SID>CloseWindow()<cr>
			nn <buffer> <BS> :cal <SID>SelectSearch( "" )<cr>
			let char = 97
			wh char < 123
				exe "nn <buffer> " . nr2char(char) . " :cal <SID>SelectSearch( '" . nr2char(char) . "' )<cr>"
				let char = char + 1
			endw
		el
			nn <buffer> h :cal <SID>MoveSelect( line(".")-1 )<CR>
			nn <buffer> k :cal <SID>MoveSelect( line(".")-1 )<CR>
			nn <buffer> l :cal <SID>MoveSelect( line(".")+1 )<CR>
			nn <buffer> j :cal <SID>MoveSelect( line(".")+1 )<CR>
			nn <buffer> q :cal <SID>CloseWindow()<cr>
		en
	en
	" Reset incremental search
	let s:srch = ""
	" Fill attributs list
	cal s:ShowAttributes()
	" User don't need to modify content
	"setl nomodifiable
endf

"**
" SearchAttributes:
" Look for attributs for word under cursor. tr
"**
fu! s:SearchAttributes()
	" Ignore case
	let l:CurrentCase = &ic
	set ignorecase
	let l:CurrentIkw = &isk

	let s:attributs = ""
	let s:maxAttrLength = 0
	let g:listSep = ","
	let l:attributsLine = ""

	setl iskeyword +=<
	if match( expand("<cword>"), '^<' ) == 0 " Is it a tag ?
		let s:itemtype = "T" " Yes, a tag
		let l:attributsLine = GetListMatchItem( s:HTMLTags, expand("<cword>") . ' ' )
	el
		setl iskeyword -=<
		setl iskeyword +=-,=
		if match( expand("<cword>"), '=$' ) != -1 " or an attribute ?
			let s:itemtype = "A" " Yes, an attribute
			let l:attributsLine = GetListMatchItem( s:TagsAttributs, expand("<cword>") . '" ' )
		el
			setl iskeyword -==
			setl iskeyword +=:
			if match( expand("<cword>"), ':' ) != -1 " or a CSS property ?
				let s:itemtype = "C" " Yes, a CSS property
				let l:attributsLine = GetListMatchItem( s:CSSProperties, '\<' . matchstr( expand("<cword>"), '^.\{-}:' ) . ' ' )
			en
		en
	en

	if l:attributsLine != ""
		let g:listSep = " "
		let l:attributsLine = RemoveListItem( l:attributsLine, 0 )
		if l:attributsLine != ""
			" Attributes values are already sorted and expanded
			if s:itemtype != "A"
				" Insert %xxxx variables content
				let l:attribut = matchstr( l:attributsLine, '%[^ ]\+' )
				wh l:attribut != ""
					exe "let l:attributsLine = substitute( l:attributsLine, '" .l:attribut. "', s:" . strpart( l:attribut, 1 ) . ", '')"
					let l:attribut = matchstr( l:attributsLine, '%[^ ]\+' )
				endw                                 " Sort items
				let l:attributsLine = QuickSortList( l:attributsLine, 0, GetListCount(l:attributsLine)-1 )
			en
			let l:attribut = GetListItem( l:attributsLine, 0 )
			wh l:attribut != ""
				" Keep max length
				if s:maxAttrLength < strlen( l:attribut )
					let s:maxAttrLength = strlen( l:attribut )
				en
				" Remove current attribut
				let l:attributsLine = RemoveListItem( l:attributsLine, 0 )
				" Is it a depracated attribute ?
				set noignorecase
				if l:attribut =~ "-D"
					let l:attribut = substitute( l:attribut, "-D", "", "")
					let s:attributs = s:attributs . "X" . l:attribut . " \n"
				el
					let s:attributs = s:attributs . " " . l:attribut . " \n"
				en
				" Next attribut
				let l:attribut = GetListItem( l:attributsLine, 0 )
			endw
		en
		" If longest attribute size is zero, then there is no attribute
		" for this tag
		if s:maxAttrLength != 0
			let s:maxAttrLength = s:maxAttrLength + 2
		en
	en
	let &isk = l:CurrentIkw
	let &ic = l:CurrentCase
endf

"**
" ShowAttributes:
" Display attributs list in current buffer.
"**
fu! s:ShowAttributes()
	" Prevent a report of our actions from showing up
	let oldRep=&report
	let save_sc = &sc
	set report=10000 nosc
	"setl modifiable
	" Erase content
	%delete
	" Put content of register f after the cursor
	put! =s:attributs
	" Erase last line
	norm G
	d
	" Move to first item
	cal s:MoveSelect(1)
	"setl nomodifiable

	" Restore config
	let &report=oldRep
	let &sc = save_sc
endf

"**
" AddItem:
" Add selected item to tag/attribute/CSS2 property.
"**
fu! s:AddItem()
	" At least one item is added
	let s:itemAdded = 1
	let l:CurrentCase = &ic
	set noignorecase
	" Get item and clean it
	let save_f=@f
	let @f = substitute( getline("."), '[<>X() ]', '', "g" )
	let &ic = l:CurrentCase
	" Go to previous window
	winc p
	" if it's a tag, put attribute at end of tag
	if s:itemtype == "T"
		" User wants single quotes ?
		if g:eh_singlequote == 1
			let @f = substitute( @f , '"', "'", 'g' )
		en
		let @f = ' ' . @f
		" Add attribute just after tag ?
		if g:eh_atfirstplace == 1
			cal search( ' \|>' )
			norm "fP
		el
			norm f>"fP
		en
	elsei s:itemtype == "A" " If it's an attribute ...
		if g:eh_singlequote == 0
			let quote = '"'
		el
			let quote = "'"
		en
		if expand("<cword>") !~ 'style' " ... replace current value by selected value
			exec 'norm 2f' .quote. 'dT' .quote. '"fPB'
		el " ... or append selected value to it for style
			exec 'norm f' .quote. '"fp'
		en
	elsei s:itemtype == "C" " If it's an CSS property, add value to it
		norm f:"fgp
	en
	" Return to attributes window
	winc p
	let @f=save_f
endf

"**
" MoveSelect:
" Move highlight to line newLineNumber.
"
" Parameter:
" newLineNumber line number to highlight.
"**
fu! s:MoveSelect( newLineNumber )
	if( a:newLineNumber < 1 || a:newLineNumber > line("$") )
		retu
	en
	"setl modifiable
	" Restore current line
	if( exists("s:currentLine") )
		cal setline( ".", s:currentLine )
	en
	" Go to new line
	let s:currentPos = a:newLineNumber
	exe s:currentPos
	" Save new current line
	let s:currentLine = getline(".")
	let modifiedLine = s:currentLine
	" Complete string with spaces
	let len = strlen(l:modifiedLine)
	wh len < s:maxAttrLength
		let modifiedLine = modifiedLine . " "
		let len = len + 1
	endw

	" Is it a deprecated attribute marked with 'X' ?
	if l:modifiedLine =~ "^X"
		let modifiedLine = substitute( modifiedLine, "^X", "(", "" )
		let modifiedLine = substitute( modifiedLine, " $", ")", "" )
	el
		let modifiedLine = substitute( modifiedLine, "^ ", "<", "" )
		let modifiedLine = substitute( modifiedLine, " $", ">", "" )
	en
	cal setline( ".", l:modifiedLine )
	"setl nomodifiable
endf

"**
" PageDown:
" Move highlight one page down.
"**
fu! s:PageDown()
	norm L
	let pos = line(".")
	norm ''
	cal s:MoveSelect( pos )
	norm zt
endf

"**
" PageUp:
" Move highlight one page up.
"**
fu! s:PageUp()
	norm H
	let pos = line(".")
	norm ''
	cal s:MoveSelect( pos )
	norm zb
endf

"**
" CloseWindow:
" Clear unused variables and highlights, reinit variables for next use and
" close current window.
"**
fu! s:CloseWindow()
	unl s:currentLine
	unl s:attributs
	let s:maxAttrLength = 0
	let s:currentPos = 2
	hi clear selectedAttribut
	hi clear deprecatedAttribut
	hi clear hiddenX
	"setl modifiable
	winc p
	if s:itemAdded == 0
		exe s:eh_curLine
		echom s:eh_curLine
		exe "norm ".s:eh_curCol."|"
	el
		let s:itemAdded = 0
		startinsert
	en
	winc p
	winc q
endf

"**
" GetBgColor:
" Try to get background color (may be not sure)
"**
fu! s:GetBgColor()
	let bgColor = synIDattr(synIDtrans(synID(1, 1, 1)), "bg")
	if bgColor == ""
		if &bg == "light"
			let bgColor = "white"
		el
			let bgColor = "black"
		en
	en
	retu bgColor
endf

"**
" SelectSearch:
" Used for incremental attribut search
"
" Parameter:
" Char  character to add to current search pattern
"**
fu! s:SelectSearch( char )
	if a:char == "" && s:srch != ""
		let s:srch = strpart( s:srch, 0, strlen( s:srch )-1 )
	el
		let s:srch = s:srch . a:char
	en
	let linenr = line(".")
	if s:srch != ""
		1
		let findlinenr =  search( '\(\<\|X\)'.s:srch, "W" )
		exe ":".linenr
		if findlinenr != 0
			ec "Attributs search : " . s:srch
			cal s:MoveSelect( findlinenr )
		el
			echoh ErrorMsg
			ec "No attribut for \"" . s:srch . "\" (use backspace)"
			echoh NONE
		en
	en
endf
