" Partially moded by Engil Hramn <admin@silverstrate.org>
" Original Author: Magnus Woldrich <trapd00r@trapd00r.se>

set background=dark
hi clear

let g:colors_name="baskerville"

if &t_Co > 255
   hi Normal          ctermfg=254 ctermbg=232
   set background=dark

   hi Boolean         ctermfg=146		cterm=bold
   hi Character       ctermfg=241
   hi Number          ctermfg=33
   hi String          ctermfg=241
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=167               cterm=bold
   hi Cursor          ctermfg=150 ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=27
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102   cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermbg=197
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=31               cterm=bold
   hi Float           ctermfg=33
   hi FoldColumn      ctermfg=67   ctermbg=233 cterm=none
   hi Folded          ctermfg=240  ctermbg=235 cterm=bold
   hi Function        ctermfg=190
   hi Identifier      ctermfg=149
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=111               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=236

   hi MatchParen      ctermfg=196 ctermbg=234   cterm=bold
   hi ModeMsg         ctermfg=215
   hi MoreMsg         ctermfg=215
   hi Operator        ctermfg=220

   " complete menu
   hi Pmenu           ctermfg=137 ctermbg=233 cterm=none
   hi PmenuSel        ctermfg=196 ctermbg=234 cterm=bold
   hi PmenuSbar       ctermfg=000 ctermbg=233 cterm=none
   hi PmenuThumb      ctermfg=137 ctermbg=235 cterm=none

   hi PreCondit       ctermfg=235               cterm=none
   hi PreProc         ctermfg=161
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=234 ctermbg=222

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=39               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=232
   hi SpecialKey      ctermfg=245

   hi SpellBad        ctermfg=196 ctermbg=233 cterm=bold
   hi SpellCap        ctermfg=094 ctermbg=233 cterm=bold
   hi SpellRare       ctermfg=096 ctermbg=233 cterm=bold
   hi SpellLocal      ctermfg=124 ctermbg=233 cterm=bold

   hi Statement       ctermfg=214               cterm=bold
   hi StatusLine      ctermfg=233 ctermbg=136
   hi StatusLineNC    ctermfg=232 ctermbg=100
   hi StorageClass    ctermfg=197               cterm=none
   hi Structure       ctermfg=197               cterm=bold
   hi Tag             ctermfg=161
   hi Title           ctermfg=71
   hi Todo            ctermfg=160 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=190              cterm=none
   hi Underlined      ctermfg=106               cterm=none

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=21  ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Comment         ctermfg=240
   hi ColorColumn                 ctermbg=235
   hi CursorLine                  ctermbg=233   cterm=none
   hi CursorColumn                ctermbg=232
   hi LineNr          ctermfg=241 ctermbg=232
   hi NonText         ctermfg=232 ctermbg=232

   hi TabLine         ctermfg=100 ctermbg=232
   hi TabLineFill     ctermfg=232 ctermbg=233
   hi TabLineSel      ctermfg=220 ctermbg=234
   hi cCustomFunc     ctermfg=220
   hi cCustomClass    ctermfg=191

 end
