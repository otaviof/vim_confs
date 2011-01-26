"Name: findMate
"Author: Manuel  Aguilar y Victor Guardiola
"Version: 0.1
"Description: Este plugin es buscador de archivos en todo un arbol de dirctorios

function! FindMate(name)
 let l:_name = substitute(a:name, "\\s", "*", "g")
 let l:list=system("find . -iname '*".l:_name."*' -not -name \"*.class\" -and -not -name \"*.swp\" -and -not -name \".*\" -and -not -name \"*.git\" | perl -ne 'print \"$.\\t$_\"'")
 let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
if l:num < 1
 echo "'".a:name."' not found"
 return
 endif

if l:num != 1
    echo l:list
    let l:input=input("Which ? (<enter>=nothing)\n")

    if strlen(l:input)==0
    return
    endif
    
    let items = split(l:input, ' ', 1)
    for item in items
       if strlen(substitute(l:item, "[0-9]", "", "g"))>0
       echo "Not a number"
       return
       endif
    
       if l:item<1 || l:item>l:num
       echo "Out of range"
       return
       endif
    
       let l:line=matchstr("\n".l:list, "\n".l:item."\t[^\n]*")
       let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
    
       execute ":open ".l:line
    endfor
else
    let l:line=substitute(l:list, "^[^\t]*\t./", "", "")
    execute ":open ".l:line
endif
endfunction
command! -nargs=1 FindMate :call FindMate("<args>")
map <leader>F :FindMate
