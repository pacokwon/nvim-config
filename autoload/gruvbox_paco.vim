" -----------------------------------------------------------------------------
" File: gruvbox_paco.vim
" Description: Personalized gruvbox theme by paco
" -----------------------------------------------------------------------------

function! gruvbox_paco#invert_signs_toggle()
  if g:gruvbox_paco_invert_signs == 0
    let g:gruvbox_paco_invert_signs=1
  else
    let g:gruvbox_paco_invert_signs=0
  endif

  colorscheme gruvbox_paco
endfunction

" Search Highlighting {{{

function! gruvbox_paco#hls_show()
  set hlsearch
  call GruvboxPacoHlsShowCursor()
endfunction

function! gruvbox_paco#hls_hide()
  set nohlsearch
  call GruvboxPacoHlsHideCursor()
endfunction

function! gruvbox_paco#hls_toggle()
  if &hlsearch
    call gruvbox_paco#hls_hide()
  else
    call gruvbox_paco#hls_show()
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
