" One line vim tricks

" Capitalize first word of each line of input
qqvUW@qq@q

" Append each line with line number
:s/^/\=line('.').' '/g<CR>
