" Twelf's sources.cfg

syn match scfgComment /%.*$/
hi def link scfgComment Comment

syn match scfgCfg /\S\+\.cfg/
hi def link scfgCfg Structure
