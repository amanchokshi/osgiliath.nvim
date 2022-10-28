" ensure we are using latex and not plaintex
let g:tex_flavour='latex'

" let g:tex_conceal = ""  " Don't use conceal for latex equations
au! BufEnter *.tex set cole=0 

set spell

setlocal softtabstop=2
setlocal shiftwidth=2

" Wrap between lines when scrolling
set whichwrap+=<,>,h,l,[,]

" Keep minimum 5 lines above or below the cursor at all times
setlocal scrolloff=5

" syntax
hi! link Folded texStyleBold
