" ryuuko.vim -- Vim color scheme.
" Author:       Dylan Araps
" Webpage:      https://github.com/dylanaraps/ryuuko
" Description:  A colorscheme
"
" Personalized by Alberto Restifo

" Initialization: {{{

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="ryuuko"

if !has('gui_running') && &t_Co != 256
  finish
endif

" }}}

" Palette: {{{

" Set up palette dictionary

" 16 colors terminal palette, we use only 9
let s:color0 = ['#232c33', 0]
let s:color1 = ['#99736e', 1]
let s:color2 = ['#78a090', 2]
let s:color3 = ['#bfb7a1', 3]
let s:color4 = ['#7c9fa6', 4]
let s:color5 = ['#BF9C86', 5]
let s:color6 = ['#99BFBA', 6]
let s:color7 = ['#f0f0f0', 7]
let s:color8 = ['#70838c', 8]

" Dark gray, sligthly brighther than the background
let s:darkGray = ['#2a343d', 235]

" Stlye helprs
let s:none = ['NONE', 'NONE']
let s:bold = 'bold,'
let s:underline = 'underline,'

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

" General Groups: {{{

call s:HL('Normal', s:color7, s:color0)
call s:HL('NonText', s:color0)
call s:HL('Comment', s:color8)
call s:HL('Error', s:color7, s:color1)
call s:HL('Identifier', s:color1)
call s:HL('Ignore', s:color0, s:color8)
call s:HL('PreProc', s:color3)
call s:HL('Special', s:color6)
call s:HL('Statement', s:color1)
call s:HL('String', s:color2)
call s:HL('Number', s:color3)
call s:HL('Todo', s:color3, s:none, s:bold)
call s:HL('Type', s:color3)
call s:HL('Underlined', s:color1, s:none, s:underline)
call s:HL('StatusLine', s:color0, s:color7)
call s:HL('StatusLineNC', s:none)
call s:HL('TabLine', s:color8)
call s:HL('TabLineFill', s:color8)
call s:HL('TabLineSel', s:color0, s:color4)
call s:HL('TermCursorNC', s:color0, s:color3)
call s:HL('VertSplit', s:none)
call s:HL('Title', s:color4)
call s:HL('CursorLine', s:color8)
call s:HL('LineNr', s:color8)
call s:HL('CursorLineNr', s:color8, s:none, s:bold)
call s:HL('Visual', s:color0, s:color8)
call s:HL('VisualNOS', s:color1)
call s:HL('Pmenu', s:color7, s:color8)
call s:HL('PmenuSbar', s:color7, s:color6)
call s:HL('PmenuSel', s:color0, s:color4)
call s:HL('PmenuThumb', s:color8, s:color8)
call s:HL('FoldColumn', s:color7)
call s:HL('Folded', s:color8)
call s:HL('WildMenu', s:color0, s:color2)
call s:HL('SpecialKey', s:color8)
call s:HL('DiffAdd', s:color2)
call s:HL('DiffChange', s:color8)
call s:HL('DiffDelete', s:color1)
call s:HL('DiffText', s:color4)
call s:HL('IncSearch', s:color0, s:color3)
call s:HL('Search', s:color0, s:color3)
call s:HL('Directory', s:color4)
call s:HL('MatchParen', s:color0, s:color8)
call s:HL('ColorColumn', s:none, s:darkGray)
call s:HL('signColumn', s:color4)
call s:HL('ErrorMsg', s:color8)
call s:HL('ModeMsg', s:color2)
call s:HL('MoreMsg', s:color2)
call s:HL('Question', s:color4)
call s:HL('WarningMsg', s:color0, s:color1)
call s:HL('Cursor', s:color8)
call s:HL('Structure', s:color5)
call s:HL('CursorColumn', s:color7, s:color8)
call s:HL('ModeMsg', s:color7)
hi SpellBad ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#99736e gui=underline guisp=#99736e
hi SpellCap ctermbg=NONE ctermfg=4 cterm=underline guibg=NONE guifg=#7c9fa6 gui=underline guisp=#7c9fa6
hi SpellLocal ctermbg=NONE ctermfg=5 cterm=underline guibg=NONE guifg=#BF9C86 gui=underline guisp=#BF9C86
hi SpellRare ctermbg=NONE ctermfg=6 cterm=underline guibg=NONE guifg=#99BFBA gui=underline guisp=#99BFBA
call s:HL('Boolean', s:color5)
call s:HL('Character', s:color1)
call s:HL('Conditional', s:color5)
call s:HL('Define', s:color5)
call s:HL('Delimiter', s:color5)
call s:HL('Float', s:color5)
call s:HL('Include', s:color4)
call s:HL('Keyword', s:color5)
call s:HL('Label', s:color3)
call s:HL('Operator', s:color7)
call s:HL('Repeat', s:color3)
call s:HL('SpecialChar', s:color5)
call s:HL('Tag', s:color3)
call s:HL('Typedef', s:color3)
hi vimUserCommand ctermbg=NONE ctermfg=1 cterm=BOLD guibg=NONE guifg=#99736e gui=BOLD
hi link vimMap vimUserCommand
hi link vimLet vimUserCommand
hi link vimCommand vimUserCommand
hi link vimFTCmd vimUserCommand
hi link vimAutoCmd vimUserCommand
hi link vimNotFunc vimUserCommand
call s:HL('vimNotation', s:color4)
call s:HL('vimMapModKey', s:color4)
call s:HL('vimBracket', s:color7)
call s:HL('vimCommentString', s:color8)
hi htmlLink ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#99736e gui=underline
call s:HL('htmlBold', s:color3)
call s:HL('htmlItalic', s:color5)
call s:HL('htmlEndTag', s:color7)
call s:HL('htmlTag', s:color7)
hi htmlTagName ctermbg=NONE ctermfg=1 cterm=BOLD guibg=NONE guifg=#99736e gui=BOLD
hi htmlH1 ctermbg=NONE ctermfg=7 cterm=BOLD guibg=NONE guifg=#f0f0f0 gui=BOLD
hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
hi link htmlH5 htmlH1
hi link htmlH6 htmlH1
call s:HL('cssMultiColumnAttr', s:color2)
hi link cssFontAttr cssMultiColumnAttr
hi link cssFlexibleBoxAttr cssMultiColumnAttr
call s:HL('cssBraces', s:color7)
hi link cssAttrComma cssBraces
call s:HL('cssValueLength', s:color7)
call s:HL('cssUnitDecorators', s:color7)
call s:HL('cssValueNumber', s:color7)
hi link cssValueLength cssValueNumber
call s:HL('cssNoise', s:color8)
call s:HL('cssTagName', s:color1)
call s:HL('cssFunctionName', s:color4)
call s:HL('scssSelectorChar', s:color7)
call s:HL('scssAttribute', s:color7)
hi link scssDefinition cssNoise
call s:HL('sassidChar', s:color1)
call s:HL('sassClassChar', s:color5)
call s:HL('sassInclude', s:color5)
call s:HL('sassMixing', s:color5)
call s:HL('sassMixinName', s:color4)
call s:HL('javaScript', s:color7)
call s:HL('javaScriptBraces', s:color7)
call s:HL('javaScriptNumber', s:color5)
hi markdownAutomaticLink ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#99736e gui=underline
hi link markdownUrl markdownAutomaticLink
call s:HL('markdownError', s:color7)
call s:HL('markdownCode', s:color3)
call s:HL('markdownCodeBlock', s:color3)
call s:HL('markdownCodeDelimiter', s:color5)
call s:HL('xdefaultsValue', s:color7)
call s:HL('rubyInclude', s:color4)
call s:HL('rubyDefine', s:color5)
call s:HL('rubyFunction', s:color4)
call s:HL('rubyStringDelimiter', s:color2)
call s:HL('rubyInteger', s:color3)
call s:HL('rubyAttribute', s:color4)
call s:HL('rubyConstant', s:color3)
call s:HL('rubyInterpolation', s:color2)
call s:HL('rubyInterpolationDelimiter', s:color3)
call s:HL('rubyRegexp', s:color6)
call s:HL('rubySymbol', s:color2)
call s:HL('rubyTodo', s:color8)
call s:HL('rubyRegexpAnchor', s:color7)
hi link rubyRegexpQuantifier rubyRegexpAnchor
call s:HL('pythonOperator', s:color5)
call s:HL('pythonFunction', s:color4)
call s:HL('pythonRepeat', s:color5)
hi pythonStatement ctermbg=NONE ctermfg=1 cterm=Bold guibg=NONE guifg=#99736e gui=Bold
call s:HL('pythonBuiltIn', s:color4)
call s:HL('phpMemberSelector', s:color7)
call s:HL('phpComparison', s:color7)
call s:HL('phpParent', s:color7)
call s:HL('cOperator', s:color6)
call s:HL('cPreCondit', s:color5)
call s:HL('SignifySignAdd', s:color2)
call s:HL('SignifySignChange', s:color4)
call s:HL('SignifySignDelete', s:color1)
call s:HL('NERDTreeDirSlash', s:color4)
call s:HL('NERDTreeExecFile', s:color7)

" }}}

" Help: {{{

call s:HL('helpLeadBlank', s:color7)
call s:HL('helpNormal', s:color7)

" }}}

	" Neovim Terminal Mode Colors.
	let g:terminal_color_0 = "\#232c33"
	let g:terminal_color_1 = "\#99736e"
	let g:terminal_color_2 = "\#78a090"
	let g:terminal_color_3 = "\#bfb7a1"
	let g:terminal_color_4 = "\#7c9fa6"
	let g:terminal_color_5 = "\#BF9C86"
	let g:terminal_color_6 = "\#99BFBA"
	let g:terminal_color_7 = "\#f0f0f0"
	let g:terminal_color_8 = "\#70838c"
	let g:terminal_color_9 = "\#99736e"
	let g:terminal_color_10 = "\#78a090"
	let g:terminal_color_11 = "\#bfb7a1"
	let g:terminal_color_12 = "\#7c9fa6"
	let g:terminal_color_13 = "\#BF9C86"
	let g:terminal_color_14 = "\#99BFBA"
	let g:terminal_color_15 = "\#f0f0f0"

" }}}
