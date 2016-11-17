set number
set tabstop=2
set expandtab
set mouse=a
set hlsearch

syntax on

:hi SpellBad ctermbg=DarkRed
:hi SpellRare ctermbg=DarkGreen
:hi SpellLocal ctermbg=DarkGreen

:highlight ExtraWhitespace ctermbg=DarkRed
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t$\|\t/

au BufNewFile,BufRead *.tex setlocal spell
au BufNewFile,BufRead *.md setlocal spell
au BufNewFile,BufRead *.rst setlocal spell
au BufNewFile,BufRead *.asciidoc setlocal spell
au BufNewFile,BufRead Makefile setlocal noexpandtab
au BufNewFile,BufRead *.mk setlocal noexpandtab
au BufNewFile,BufRead *.fo setlocal ft=fasto
au BufNewFile,BufRead *.fs setlocal ft=fsharp
au BufNewFile,BufRead *.lex call Mosmllex()
au BufNewFile,BufRead *.grm call Mosmlyac()
au BufNewFile,BufRead *.sig setlocal ft=sml

function Mosmllex()
  setlocal ft=sml
  syn keyword mosmllexKeyword rule parse eof

  syn match mosmllexCharacter "`\([^`\\]\|\\\\\|\\`\|\\[nrtb]\|\\^[^`\\]\|\\\d\d\d\)`"

  highlight link mosmllexKeyword Keyword
  highlight link mosmllexCharacter Character
endfunction

function Mosmlyac()
  setlocal ft=sml

  syn match mosmlyacKeyword "%\(token\|start\|type\|left\|right\|nonassoc\|%\|{\|}\|prec\)"
  syn match mosmlyacMacro "$\d\+"

  highlight link mosmlyacKeyword Keyword
  highlight link mosmlyacMacro Macro
endfunction

au BufNewFile,BufRead */Staffeli/* set expandtab tabstop=4

au BufNewFile,BufRead */kudos/* if @% != 'Makefile' |  set expandtab tabstop=2
