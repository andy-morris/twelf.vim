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

syn match twelfPcErr /\w\+/ contained
hi def link twelfPcErr Error

syn keyword twelfPcDir contained abbrev infix prefix postfix name query
  \ clause tabled querytabled deterministic mode terminates reduces block
  \ worlds total freeze theorem prove establish use covers unique define
  \ sig struct open view
hi link twelfPcDir twelfPercent

syn keyword twelfPcUnsafe contained assert trustme thaw
hi def link twelfPcUnsafe Debug

syn match twelfPercent /%\w\+/ contains=twelfPc.*
hi def link twelfPercent PreProc

syn match twelfInfix transparent /%infix/
  \ nextgroup=twelfAssoc skipwhite skipnl
syn match twelfPrePostfix transparent /%\(pre\|post\)fix/
  \ nextgroup=twelfPrec skipwhite skipnl
syn keyword twelfAssoc contained left right none
  \ nextgroup=twelfPrec skipwhite skipnl
hi def link twelfAssoc Special
syn match twelfPrec contained /\d\+/
hi def link twelfPrec Number

syn keyword twelfType type
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
