if exists('g:loaded_diffurcate') || &cp
  finish
endif

let g:loaded_diffurcate = '0.0.1' " version number
let s:keepcpo = &cpo
set cpo&vim

command! Diffurcate call diffurcate#Run()

let &cpo = s:keepcpo
unlet s:keepcpo
