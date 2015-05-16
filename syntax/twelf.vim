" Syntax file for twelf files
" Author:   Andy Morris
" License:  Same as Vim

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "twelf"

if version < 600
  syntax clear
endif

setlocal isk+=-,=,/,<,>,+,*,.

setlocal comments=b:%%
setlocal formatoptions-=o

syn match twelfBuiltin
  \ /\(^\|\s\|[:[\]{}()]\)\@1<=\(=\|->\|<-\)\(\s\|[:[\]{}()]\|$\)\@=/
hi def link twelfBuiltin Keyword

syn match twelfResChar /[:[\]{}()]\|\.\>/
hi def link twelfResChar Delimiter

syn match twelfPcErr /%\w\+/
hi def link twelfPcErr SpellBad

syn match twelfDirective /%\(abbrev\|\(in\|pre\|post\)fix\|name\|query\)\>/
syn match twelfDirective /%\(tabled\|querytabled\|deterministic\)\>/
syn match twelfDirective /%\(mode\|terminates\|reduces\|block\|worlds\)\>/
syn match twelfDirective /%\(total\|freeze\|covers\|unique\)\>/
hi def link twelfDirective PreProc

syn match twelfProof /%\(theorem\|prove\|establish\|solve\|define\)\>/
hi def link twelfProof Structure

syn match twelfMod /%\(sig\|struct\|open\|view\|include\)\>/
  \ nextgroup=twelfModNameAlone skipwhite skipnl
hi def link twelfMod PreProc

syn match twelfModNameAlone contained /\(\S\&[^:.[\]{}()]\)\+/
  \ nextgroup=twelfModPunc skipwhite skipnl
hi def link twelfModNameAlone Structure

syn match twelfModPunc contained /:\|=\|:=/
  \ nextgroup=twelfModNameAlone skipwhite skipnl
hi link twelfModPunc twelfResChar

syn match twelfPcUnsafe /%\(assert\|trustme\|thaw\)\>/
hi def link twelfPcUnsafe Debug

syn match twelfInfix transparent /%infix/
  \ nextgroup=twelfAssoc skipwhite skipnl
syn match twelfPrePostfix transparent /%\(pre\|post\)fix/
  \ nextgroup=twelfPrec skipwhite skipnl
syn keyword twelfAssoc contained left right none
  \ nextgroup=twelfPrec skipwhite skipnl
hi def link twelfAssoc Special
syn match twelfPrec contained /\d\+/
hi def link twelfPrec Number

syn match twelfType /\<type\ze\.\?\>/
hi def link twelfType Constant

syn match twelfNameDec /\(\(\S\&[^:[\]{}()]\)\+\)\ze\_s*:/
syn match twelfNameDec
  \ /\(\.\_[^.:]*:\_[^.:]*\)\@<!\(\S\&[^:[\]{}()]\)\+\ze\_s\+=\_s/
hi def link twelfNameDec Function

syn match twelfUppercase /\(\<\|\<-\@<=\)\?\u\(\S\&[^.:[\]{}()]\)*/
hi def link twelfUppercase Identifier

syn match twelfCommentLine /%\(%\|\s\).*$/
  \ contains=twelfTodo
syn region twelfCommentBlock start=/%{/ end=/}%/
  \ contains=twelfCommentBlock,twelfTodo
hi def link twelfComment Comment
hi link twelfCommentLine twelfComment
hi link twelfCommentBlock twelfComment

syn keyword twelfTodo contained TODO FIXME XXX
hi def link twelfTodo Todo

syn match twelfMode /\<\(-1\?\|[+*]\)\u\@=/ nextgroup=twelfUppercase
hi def link twelfMode Special

syn match twelfUnderscore /\(\S\&[^.:[\]{}()]\)\@<!_\(\S\&[^.:[\]{}()]\)\@!/
hi def link twelfUnderscore Special

syn region twelfAfterEOF matchgroup=twelfEOF start=/%\./ end=/\%$/
hi def link twelfEOF Special
hi def link twelfAfterEOF Comment

syn match twelfModName /\<\u\k*\ze\.\S/
hi def link twelfModName Structure
