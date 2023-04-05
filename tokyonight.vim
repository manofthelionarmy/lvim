let g:tokyonight_style="night"
let g:tokyonight_hide_inactive_statusline=1
let g:tokyonight_transparent_sidebar=1
let g:tokyonight_lualine_bold=1
let g:tokyonight_transparent=1
let g:tokyonight_italic_comments=1
" let g:tokyonight_italic_functions = 1    
let g:tokyonight_terminal_colors=1
let g:tokyonight_lualine_bold=1
" let g:tokyonight_italic_variables=1

augroup MyColors
	autocmd!
	autocmd ColorScheme * hi LineNr guifg=#5081c0 
        \ | hi CursorLineNR guifg=#FFba00
        \ | hi Comment guifg=#5081c0 gui=italic,bold
        \ | hi ErrorMsg gui=undercurl
        \ | hi WarningMsg gui=undercurl
        \ | hi NvimTreeNormal guifg=NONE guibg=NONE
        \ | hi Todo gui=bold
        \ | hi TSKeyword gui=NONE | hi Keyword gui=NONE "gui=bold for tokyo
        \ | hi Function gui=NONE 
      " \ | hi Visual guifg=black guibg=#F1FA8C " set this for dracula
augroup END

augroup MyFloat
	autocmd!
	" autocmd ColorScheme * hi NormalFloat guifg=#5081c0 gui=bold "set for tokyo
augroup END

