" One line vim tricks

" Capitalize first word of each line of input
qqvUW@qq@q

" Append each line with line number
:s/^/\=line('.').' '/g<CR>

" Join all lines in file
:%j<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Matches
:g/\v^(<Tab><Tab>+)\1+</            " Match all lines containing non-prime number of tab chars
