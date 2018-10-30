#!/bin/bash

# Useless tricks which may make good notes

# Calculator, works on args or stdin
# Reads from $@ if set, stdin otherwise
# Evaluates via $(())
calc() { echo "$((${@:-$(</dev/stdin)}))"; }

# Print all 256 colors in foreground
# The magic escape code here is "\e[38;5;${color}m"
# \e[0m clears the color
colors_fg()
{
    for i in {1..256}; do echo -e "\e[38;5;${i}mcolor${i} \e[0m"; done
}

# Prints all 256 colors in background
# Here the escape code is "\e[48;5;${color}m"
colors_bg()
{
    for i in {1..256}; do echo -e "\e[48;5;${i}m color${i} \e[0m; done
}

