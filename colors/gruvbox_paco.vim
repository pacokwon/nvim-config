" -----------------------------------------------------------------------------
" File: gruvbox_paco.vim
" Description: Personalized gruvbox theme by paco
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='gruvbox_paco'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:gruvbox_paco_bold')
  let g:gruvbox_paco_bold=1
endif
if !exists('g:gruvbox_paco_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:gruvbox_paco_italic=1
  else
    let g:gruvbox_paco_italic=0
  endif
endif
if !exists('g:gruvbox_paco_undercurl')
  let g:gruvbox_paco_undercurl=1
endif
if !exists('g:gruvbox_paco_underline')
  let g:gruvbox_paco_underline=1
endif
if !exists('g:gruvbox_paco_inverse')
  let g:gruvbox_paco_inverse=1
endif

if !exists('g:gruvbox_paco_guisp_fallback') || index(['fg', 'bg'], g:gruvbox_paco_guisp_fallback) == -1
  let g:gruvbox_paco_guisp_fallback='NONE'
endif

if !exists('g:gruvbox_paco_improved_strings')
  let g:gruvbox_paco_improved_strings=0
endif

if !exists('g:gruvbox_paco_improved_warnings')
  let g:gruvbox_paco_improved_warnings=0
endif

if !exists('g:gruvbox_paco_termcolors')
  let g:gruvbox_paco_termcolors=256
endif

if !exists('g:gruvbox_paco_invert_indent_guides')
  let g:gruvbox_paco_invert_indent_guides=0
endif

if exists('g:gruvbox_paco_contrast')
  echo 'g:gruvbox_paco_contrast is deprecated; use g:gruvbox_paco_contrast_light and g:gruvbox_paco_contrast_dark instead'
endif

if !exists('g:gruvbox_paco_contrast_dark')
  let g:gruvbox_paco_contrast_dark='medium'
endif

if !exists('g:gruvbox_paco_contrast_light')
  let g:gruvbox_paco_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:gb.dark0       = ['#181818', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#32302f', 236]     " 50-48-47
let s:gb.dark1       = ['#3c3836', 237]     " 60-56-54
let s:gb.dark2       = ['#504945', 239]     " 80-73-69
let s:gb.dark3       = ['#665c54', 241]     " 102-92-84
let s:gb.dark4       = ['#7c6f64', 243]     " 124-111-100
let s:gb.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:gb.gray_245    = ['#928374', 245]     " 146-131-116
let s:gb.gray_244    = ['#928374', 244]     " 146-131-116

let s:gb.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:gb.light0      = ['#fff7d9', 229]     " 253-244-193
let s:gb.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:gb.light1      = ['#fff0cc', 223]     " 235-219-178
let s:gb.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:gb.light3      = ['#bdae93', 248]     " 189-174-147
let s:gb.light4      = ['#a89984', 246]     " 168-153-132
let s:gb.light4_256  = ['#a89984', 246]     " 168-153-132

let s:gb.bright_red     = ['#ff006f', 167]     " 251-73-52
let s:gb.bright_green   = ['#dfe32b', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#9ae3de', 109]     " 131-165-152
let s:gb.bright_purple  = ['#ff6ebe', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#c1ffab', 108]     " 142-192-124
let s:gb.bright_orange  = ['#ffad14', 208]     " 254-128-25

let s:gb.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:gruvbox_paco_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:gruvbox_paco_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:gruvbox_paco_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:gruvbox_paco_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:gruvbox_paco_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:gruvbox_paco_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:gruvbox_paco_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:gruvbox_paco_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:gruvbox_paco_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:gruvbox_paco_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:gruvbox_paco_hls_cursor')
  let s:hls_cursor = get(s:gb, g:gruvbox_paco_hls_cursor)
endif

let s:number_column = s:none
if exists('g:gruvbox_paco_number_column')
  let s:number_column = get(s:gb, g:gruvbox_paco_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:gruvbox_paco_sign_column')
    let s:sign_column = get(s:gb, g:gruvbox_paco_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:gruvbox_paco_color_column')
  let s:color_column = get(s:gb, g:gruvbox_paco_color_column)
endif

let s:vert_split = s:bg0
if exists('g:gruvbox_paco_vert_split')
  let s:vert_split = get(s:gb, g:gruvbox_paco_vert_split)
endif

let s:invert_signs = ''
if exists('g:gruvbox_paco_invert_signs')
  if g:gruvbox_paco_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:gruvbox_paco_invert_selection')
  if g:gruvbox_paco_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:gruvbox_paco_invert_tabline')
  if g:gruvbox_paco_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:gruvbox_paco_italicize_comments')
  if g:gruvbox_paco_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:gruvbox_paco_italicize_strings')
  if g:gruvbox_paco_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvbox_paco_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvbox_paco_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" GruvboxPaco Hi Groups: {{{

" memoize common hi groups
call s:HL('GruvboxPacoFg0', s:fg0)
call s:HL('GruvboxPacoFg1', s:fg1)
call s:HL('GruvboxPacoFg2', s:fg2)
call s:HL('GruvboxPacoFg3', s:fg3)
call s:HL('GruvboxPacoFg4', s:fg4)
call s:HL('GruvboxPacoGray', s:gray)
call s:HL('GruvboxPacoBg0', s:bg0)
call s:HL('GruvboxPacoBg1', s:bg1)
call s:HL('GruvboxPacoBg2', s:bg2)
call s:HL('GruvboxPacoBg3', s:bg3)
call s:HL('GruvboxPacoBg4', s:bg4)

call s:HL('GruvboxPacoRed', s:red)
call s:HL('GruvboxPacoRedBold', s:red, s:none, s:bold)
call s:HL('GruvboxPacoGreen', s:green)
call s:HL('GruvboxPacoGreenBold', s:green, s:none, s:bold)
call s:HL('GruvboxPacoYellow', s:yellow)
call s:HL('GruvboxPacoYellowBold', s:yellow, s:none, s:bold)
call s:HL('GruvboxPacoBlue', s:blue)
call s:HL('GruvboxPacoBlueBold', s:blue, s:none, s:bold)
call s:HL('GruvboxPacoPurple', s:purple)
call s:HL('GruvboxPacoPurpleBold', s:purple, s:none, s:bold)
call s:HL('GruvboxPacoAqua', s:aqua)
call s:HL('GruvboxPacoAquaBold', s:aqua, s:none, s:bold)
call s:HL('GruvboxPacoOrange', s:orange)
call s:HL('GruvboxPacoOrangeBold', s:orange, s:none, s:bold)

call s:HL('GruvboxPacoRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('GruvboxPacoGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('GruvboxPacoYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('GruvboxPacoBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('GruvboxPacoPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('GruvboxPacoAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox_paco/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText GruvboxPacoBg2
hi! link SpecialKey GruvboxPacoBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory GruvboxPacoGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title GruvboxPacoGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg GruvboxPacoYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg GruvboxPacoYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question GruvboxPacoOrangeBold
" Warning messages
hi! link WarningMsg GruvboxPacoRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:gruvbox_paco_improved_strings == 0
  hi! link Special GruvboxPacoOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement GruvboxPacoRed
" if, then, else, endif, swicth, etc.
hi! link Conditional GruvboxPacoRed
" for, do, while, etc.
hi! link Repeat GruvboxPacoRed
" case, default, etc.
hi! link Label GruvboxPacoRed
" try, catch, throw
hi! link Exception GruvboxPacoRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword GruvboxPacoRed

" Variable name
hi! link Identifier GruvboxPacoBlue
" Function name
hi! link Function GruvboxPacoGreenBold

" Generic preprocessor
hi! link PreProc GruvboxPacoAqua
" Preprocessor #include
hi! link Include GruvboxPacoAqua
" Preprocessor #define
hi! link Define GruvboxPacoAqua
" Same as Define
hi! link Macro GruvboxPacoAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit GruvboxPacoAqua

" Generic constant
hi! link Constant GruvboxPacoPurple
" Character constant: 'c', '/n'
hi! link Character GruvboxPacoPurple
" String constant: "this is a string"
if g:gruvbox_paco_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean GruvboxPacoPurple
" Number constant: 234, 0xff
hi! link Number GruvboxPacoPurple
" Floating point constant: 2.3e10
hi! link Float GruvboxPacoPurple

" Generic type
hi! link Type GruvboxPacoYellow
" static, register, volatile, etc
hi! link StorageClass GruvboxPacoOrange
" struct, union, enum, etc.
hi! link Structure GruvboxPacoAqua
" typedef
hi! link Typedef GruvboxPacoYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:gruvbox_paco_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" Netrw: {{{

hi! link netrwDir GruvboxPacoAqua
hi! link netrwClassify GruvboxPacoAqua
hi! link netrwLink GruvboxPacoGray
hi! link netrwSymLink GruvboxPacoFg1
hi! link netrwExe GruvboxPacoYellow
hi! link netrwComment GruvboxPacoGray
hi! link netrwList GruvboxPacoBlue
hi! link netrwHelpCmd GruvboxPacoAqua
hi! link netrwCmdSep GruvboxPacoFg3
hi! link netrwVersion GruvboxPacoGreen

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded GruvboxPacoGreen
hi! link diffRemoved GruvboxPacoRed
hi! link diffChanged GruvboxPacoAqua

hi! link diffFile GruvboxPacoOrange
hi! link diffNewFile GruvboxPacoYellow

hi! link diffLine GruvboxPacoBlue

" }}}
" Html: {{{

hi! link htmlTag GruvboxPacoBlue
hi! link htmlEndTag GruvboxPacoBlue

hi! link htmlTagName GruvboxPacoAquaBold
hi! link htmlArg GruvboxPacoAqua

hi! link htmlScriptTag GruvboxPacoPurple
hi! link htmlTagN GruvboxPacoFg1
hi! link htmlSpecialTagName GruvboxPacoAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar GruvboxPacoOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag GruvboxPacoBlue
hi! link xmlEndTag GruvboxPacoBlue
hi! link xmlTagName GruvboxPacoBlue
hi! link xmlEqual GruvboxPacoBlue
hi! link docbkKeyword GruvboxPacoAquaBold

hi! link xmlDocTypeDecl GruvboxPacoGray
hi! link xmlDocTypeKeyword GruvboxPacoPurple
hi! link xmlCdataStart GruvboxPacoGray
hi! link xmlCdataCdata GruvboxPacoPurple
hi! link dtdFunction GruvboxPacoGray
hi! link dtdTagName GruvboxPacoPurple

hi! link xmlAttrib GruvboxPacoAqua
hi! link xmlProcessingDelim GruvboxPacoGray
hi! link dtdParamEntityPunct GruvboxPacoGray
hi! link dtdParamEntityDPunct GruvboxPacoGray
hi! link xmlAttribPunct GruvboxPacoGray

hi! link xmlEntity GruvboxPacoOrange
hi! link xmlEntityPunct GruvboxPacoOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation GruvboxPacoOrange
hi! link vimBracket GruvboxPacoOrange
hi! link vimMapModKey GruvboxPacoOrange
hi! link vimFuncSID GruvboxPacoFg3
hi! link vimSetSep GruvboxPacoFg3
hi! link vimSep GruvboxPacoFg3
hi! link vimContinue GruvboxPacoFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword GruvboxPacoBlue
hi! link clojureCond GruvboxPacoOrange
hi! link clojureSpecial GruvboxPacoOrange
hi! link clojureDefine GruvboxPacoOrange

hi! link clojureFunc GruvboxPacoYellow
hi! link clojureRepeat GruvboxPacoYellow
hi! link clojureCharacter GruvboxPacoAqua
hi! link clojureStringEscape GruvboxPacoAqua
hi! link clojureException GruvboxPacoRed

hi! link clojureRegexp GruvboxPacoAqua
hi! link clojureRegexpEscape GruvboxPacoAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen GruvboxPacoFg3
hi! link clojureAnonArg GruvboxPacoYellow
hi! link clojureVariable GruvboxPacoBlue
hi! link clojureMacro GruvboxPacoOrange

hi! link clojureMeta GruvboxPacoYellow
hi! link clojureDeref GruvboxPacoYellow
hi! link clojureQuote GruvboxPacoYellow
hi! link clojureUnquote GruvboxPacoYellow

" }}}
" C: {{{

hi! link cOperator GruvboxPacoPurple
hi! link cStructure GruvboxPacoOrange

" }}}
" Python: {{{

hi! link pythonBuiltin GruvboxPacoOrange
hi! link pythonBuiltinObj GruvboxPacoOrange
hi! link pythonBuiltinFunc GruvboxPacoOrange
hi! link pythonFunction GruvboxPacoAqua
hi! link pythonDecorator GruvboxPacoRed
hi! link pythonInclude GruvboxPacoBlue
hi! link pythonImport GruvboxPacoBlue
hi! link pythonRun GruvboxPacoBlue
hi! link pythonCoding GruvboxPacoBlue
hi! link pythonOperator GruvboxPacoRed
hi! link pythonException GruvboxPacoRed
hi! link pythonExceptions GruvboxPacoPurple
hi! link pythonBoolean GruvboxPacoPurple
hi! link pythonDot GruvboxPacoFg3
hi! link pythonConditional GruvboxPacoRed
hi! link pythonRepeat GruvboxPacoRed
hi! link pythonDottedName GruvboxPacoGreenBold

" }}}
" CSS: {{{

hi! link cssBraces GruvboxPacoBlue
hi! link cssFunctionName GruvboxPacoYellow
hi! link cssIdentifier GruvboxPacoOrange
hi! link cssClassName GruvboxPacoGreen
hi! link cssColor GruvboxPacoBlue
hi! link cssSelectorOp GruvboxPacoBlue
hi! link cssSelectorOp2 GruvboxPacoBlue
hi! link cssImportant GruvboxPacoGreen
hi! link cssVendor GruvboxPacoFg1

hi! link cssTextProp GruvboxPacoAqua
hi! link cssAnimationProp GruvboxPacoAqua
hi! link cssUIProp GruvboxPacoYellow
hi! link cssTransformProp GruvboxPacoAqua
hi! link cssTransitionProp GruvboxPacoAqua
hi! link cssPrintProp GruvboxPacoAqua
hi! link cssPositioningProp GruvboxPacoYellow
hi! link cssBoxProp GruvboxPacoAqua
hi! link cssFontDescriptorProp GruvboxPacoAqua
hi! link cssFlexibleBoxProp GruvboxPacoAqua
hi! link cssBorderOutlineProp GruvboxPacoAqua
hi! link cssBackgroundProp GruvboxPacoAqua
hi! link cssMarginProp GruvboxPacoAqua
hi! link cssListProp GruvboxPacoAqua
hi! link cssTableProp GruvboxPacoAqua
hi! link cssFontProp GruvboxPacoAqua
hi! link cssPaddingProp GruvboxPacoAqua
hi! link cssDimensionProp GruvboxPacoAqua
hi! link cssRenderProp GruvboxPacoAqua
hi! link cssColorProp GruvboxPacoAqua
hi! link cssGeneratedContentProp GruvboxPacoAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces GruvboxPacoFg1
hi! link javaScriptFunction GruvboxPacoAqua
hi! link javaScriptIdentifier GruvboxPacoRed
hi! link javaScriptMember GruvboxPacoBlue
hi! link javaScriptNumber GruvboxPacoPurple
hi! link javaScriptNull GruvboxPacoPurple
hi! link javaScriptParens GruvboxPacoFg3

" }}}
" YAJS: {{{

hi! link javascriptImport GruvboxPacoAqua
hi! link javascriptExport GruvboxPacoAqua
hi! link javascriptClassKeyword GruvboxPacoAqua
hi! link javascriptClassExtends GruvboxPacoAqua
hi! link javascriptDefault GruvboxPacoAqua

hi! link javascriptClassName GruvboxPacoYellow
hi! link javascriptClassSuperName GruvboxPacoYellow
hi! link javascriptGlobal GruvboxPacoYellow

hi! link javascriptEndColons GruvboxPacoFg1
hi! link javascriptFuncArg GruvboxPacoFg1
hi! link javascriptGlobalMethod GruvboxPacoFg1
hi! link javascriptNodeGlobal GruvboxPacoFg1
hi! link javascriptBOMWindowProp GruvboxPacoFg1
hi! link javascriptArrayMethod GruvboxPacoFg1
hi! link javascriptArrayStaticMethod GruvboxPacoFg1
hi! link javascriptCacheMethod GruvboxPacoFg1
hi! link javascriptDateMethod GruvboxPacoFg1
hi! link javascriptMathStaticMethod GruvboxPacoFg1

" hi! link javascriptProp GruvboxPacoFg1
hi! link javascriptURLUtilsProp GruvboxPacoFg1
hi! link javascriptBOMNavigatorProp GruvboxPacoFg1
hi! link javascriptDOMDocMethod GruvboxPacoFg1
hi! link javascriptDOMDocProp GruvboxPacoFg1
hi! link javascriptBOMLocationMethod GruvboxPacoFg1
hi! link javascriptBOMWindowMethod GruvboxPacoFg1
hi! link javascriptStringMethod GruvboxPacoFg1

hi! link javascriptVariable GruvboxPacoOrange
" hi! link javascriptVariable GruvboxPacoRed
" hi! link javascriptIdentifier GruvboxPacoOrange
" hi! link javascriptClassSuper GruvboxPacoOrange
hi! link javascriptIdentifier GruvboxPacoOrange
hi! link javascriptClassSuper GruvboxPacoOrange

" hi! link javascriptFuncKeyword GruvboxPacoOrange
" hi! link javascriptAsyncFunc GruvboxPacoOrange
hi! link javascriptFuncKeyword GruvboxPacoAqua
hi! link javascriptAsyncFunc GruvboxPacoAqua
hi! link javascriptClassStatic GruvboxPacoOrange

hi! link javascriptOperator GruvboxPacoRed
hi! link javascriptForOperator GruvboxPacoRed
hi! link javascriptYield GruvboxPacoRed
hi! link javascriptExceptions GruvboxPacoRed
hi! link javascriptMessage GruvboxPacoRed

hi! link javascriptTemplateSB GruvboxPacoAqua
hi! link javascriptTemplateSubstitution GruvboxPacoFg1

" hi! link javascriptLabel GruvboxPacoBlue
" hi! link javascriptObjectLabel GruvboxPacoBlue
" hi! link javascriptPropertyName GruvboxPacoBlue
hi! link javascriptLabel GruvboxPacoFg1
hi! link javascriptObjectLabel GruvboxPacoFg1
hi! link javascriptPropertyName GruvboxPacoFg1

hi! link javascriptLogicSymbols GruvboxPacoFg1
hi! link javascriptArrowFunc GruvboxPacoYellow

hi! link javascriptDocParamName GruvboxPacoFg4
hi! link javascriptDocTags GruvboxPacoFg4
hi! link javascriptDocNotation GruvboxPacoFg4
hi! link javascriptDocParamType GruvboxPacoFg4
hi! link javascriptDocNamedParamType GruvboxPacoFg4

hi! link javascriptBrackets GruvboxPacoFg1
hi! link javascriptDOMElemAttrs GruvboxPacoFg1
hi! link javascriptDOMEventMethod GruvboxPacoFg1
hi! link javascriptDOMNodeMethod GruvboxPacoFg1
hi! link javascriptDOMStorageMethod GruvboxPacoFg1
hi! link javascriptHeadersMethod GruvboxPacoFg1

hi! link javascriptAsyncFuncKeyword GruvboxPacoRed
hi! link javascriptAwaitFuncKeyword GruvboxPacoRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword GruvboxPacoAqua
hi! link jsExtendsKeyword GruvboxPacoAqua
hi! link jsExportDefault GruvboxPacoAqua
hi! link jsTemplateBraces GruvboxPacoAqua
hi! link jsGlobalNodeObjects GruvboxPacoFg1
hi! link jsGlobalObjects GruvboxPacoFg1
hi! link jsFunction GruvboxPacoAqua
hi! link jsFuncParens GruvboxPacoFg3
hi! link jsParens GruvboxPacoFg3
hi! link jsNull GruvboxPacoPurple
hi! link jsUndefined GruvboxPacoPurple
hi! link jsClassDefinition GruvboxPacoYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved GruvboxPacoAqua
hi! link typeScriptLabel GruvboxPacoAqua
hi! link typeScriptFuncKeyword GruvboxPacoAqua
hi! link typeScriptIdentifier GruvboxPacoOrange
hi! link typeScriptBraces GruvboxPacoFg1
hi! link typeScriptEndColons GruvboxPacoFg1
hi! link typeScriptDOMObjects GruvboxPacoFg1
hi! link typeScriptAjaxMethods GruvboxPacoFg1
hi! link typeScriptLogicSymbols GruvboxPacoFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects GruvboxPacoFg1
hi! link typeScriptParens GruvboxPacoFg3
hi! link typeScriptOpSymbols GruvboxPacoFg3
hi! link typeScriptHtmlElemProperties GruvboxPacoFg1
hi! link typeScriptNull GruvboxPacoPurple
hi! link typeScriptInterpolationDelimiter GruvboxPacoAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword GruvboxPacoAqua
hi! link purescriptModuleName GruvboxPacoFg1
hi! link purescriptWhere GruvboxPacoAqua
hi! link purescriptDelimiter GruvboxPacoFg4
hi! link purescriptType GruvboxPacoFg1
hi! link purescriptImportKeyword GruvboxPacoAqua
hi! link purescriptHidingKeyword GruvboxPacoAqua
hi! link purescriptAsKeyword GruvboxPacoAqua
hi! link purescriptStructure GruvboxPacoAqua
hi! link purescriptOperator GruvboxPacoBlue

hi! link purescriptTypeVar GruvboxPacoFg1
hi! link purescriptConstructor GruvboxPacoFg1
hi! link purescriptFunction GruvboxPacoFg1
hi! link purescriptConditional GruvboxPacoOrange
hi! link purescriptBacktick GruvboxPacoOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp GruvboxPacoFg3
hi! link coffeeSpecialOp GruvboxPacoFg3
hi! link coffeeCurly GruvboxPacoOrange
hi! link coffeeParen GruvboxPacoFg3
hi! link coffeeBracket GruvboxPacoOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter GruvboxPacoGreen
hi! link rubyInterpolationDelimiter GruvboxPacoAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier GruvboxPacoRed
hi! link objcDirective GruvboxPacoBlue

" }}}
" Go: {{{

hi! link goDirective GruvboxPacoAqua
hi! link goConstants GruvboxPacoPurple
hi! link goDeclaration GruvboxPacoRed
hi! link goDeclType GruvboxPacoBlue
hi! link goBuiltins GruvboxPacoOrange

" }}}
" Lua: {{{

hi! link luaIn GruvboxPacoRed
hi! link luaFunction GruvboxPacoAqua
hi! link luaTable GruvboxPacoOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp GruvboxPacoFg3
hi! link moonExtendedOp GruvboxPacoFg3
hi! link moonFunction GruvboxPacoFg3
hi! link moonObject GruvboxPacoYellow

" }}}
" Java: {{{

hi! link javaAnnotation GruvboxPacoBlue
hi! link javaDocTags GruvboxPacoAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen GruvboxPacoFg3
hi! link javaParen1 GruvboxPacoFg3
hi! link javaParen2 GruvboxPacoFg3
hi! link javaParen3 GruvboxPacoFg3
hi! link javaParen4 GruvboxPacoFg3
hi! link javaParen5 GruvboxPacoFg3
hi! link javaOperator GruvboxPacoOrange

hi! link javaVarArg GruvboxPacoGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter GruvboxPacoGreen
hi! link elixirInterpolationDelimiter GruvboxPacoAqua

hi! link elixirModuleDeclaration GruvboxPacoYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition GruvboxPacoFg1
hi! link scalaCaseFollowing GruvboxPacoFg1
hi! link scalaCapitalWord GruvboxPacoFg1
hi! link scalaTypeExtension GruvboxPacoFg1

hi! link scalaKeyword GruvboxPacoRed
hi! link scalaKeywordModifier GruvboxPacoRed

hi! link scalaSpecial GruvboxPacoAqua
hi! link scalaOperator GruvboxPacoFg1

hi! link scalaTypeDeclaration GruvboxPacoYellow
hi! link scalaTypeTypePostDeclaration GruvboxPacoYellow

hi! link scalaInstanceDeclaration GruvboxPacoFg1
hi! link scalaInterpolation GruvboxPacoAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 GruvboxPacoGreenBold
hi! link markdownH2 GruvboxPacoGreenBold
hi! link markdownH3 GruvboxPacoYellowBold
hi! link markdownH4 GruvboxPacoYellowBold
hi! link markdownH5 GruvboxPacoYellow
hi! link markdownH6 GruvboxPacoYellow

hi! link markdownCode GruvboxPacoAqua
hi! link markdownCodeBlock GruvboxPacoAqua
hi! link markdownCodeDelimiter GruvboxPacoAqua

hi! link markdownBlockquote GruvboxPacoGray
hi! link markdownListMarker GruvboxPacoGray
hi! link markdownOrderedListMarker GruvboxPacoGray
hi! link markdownRule GruvboxPacoGray
hi! link markdownHeadingRule GruvboxPacoGray

hi! link markdownUrlDelimiter GruvboxPacoFg3
hi! link markdownLinkDelimiter GruvboxPacoFg3
hi! link markdownLinkTextDelimiter GruvboxPacoFg3

hi! link markdownHeadingDelimiter GruvboxPacoOrange
hi! link markdownUrl GruvboxPacoPurple
hi! link markdownUrlTitleDelimiter GruvboxPacoGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType GruvboxPacoYellow
" hi! link haskellOperators GruvboxPacoOrange
" hi! link haskellConditional GruvboxPacoAqua
" hi! link haskellLet GruvboxPacoOrange
"
hi! link haskellType GruvboxPacoFg1
hi! link haskellIdentifier GruvboxPacoFg1
hi! link haskellSeparator GruvboxPacoFg1
hi! link haskellDelimiter GruvboxPacoFg4
hi! link haskellOperators GruvboxPacoBlue
"
hi! link haskellBacktick GruvboxPacoOrange
hi! link haskellStatement GruvboxPacoOrange
hi! link haskellConditional GruvboxPacoOrange

hi! link haskellLet GruvboxPacoAqua
hi! link haskellDefault GruvboxPacoAqua
hi! link haskellWhere GruvboxPacoAqua
hi! link haskellBottom GruvboxPacoAqua
hi! link haskellBlockKeywords GruvboxPacoAqua
hi! link haskellImportKeywords GruvboxPacoAqua
hi! link haskellDeclKeyword GruvboxPacoAqua
hi! link haskellDeriving GruvboxPacoAqua
hi! link haskellAssocType GruvboxPacoAqua

hi! link haskellNumber GruvboxPacoPurple
hi! link haskellPragma GruvboxPacoPurple

hi! link haskellString GruvboxPacoGreen
hi! link haskellChar GruvboxPacoGreen

" }}}
" Json: {{{

hi! link jsonKeyword GruvboxPacoGreen
hi! link jsonQuote GruvboxPacoGreen
hi! link jsonBraces GruvboxPacoFg1
hi! link jsonString GruvboxPacoFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! GruvboxPacoHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! GruvboxPacoHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:

