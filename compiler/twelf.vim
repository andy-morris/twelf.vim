if expand('%:t') == 'sources.cfg'
  setfiletype sources_cfg
elseif expand('%:e') == 'elf'
  setfiletype twelf
endif
let &l:errorformat = '%-GTwelf %.%#,%-G%%%% %\w%# %%%%,%E%f:%l.%c-%*[0123456789.] Error: %#,%C %#%m'
let &l:makeprg='echo "set chatter 0\\nmake\\nquit"\|twelf-server'
