#!/bin/bash

# Useless tricks which may make good notes

# Calculator, works on args or stdin
# Reads from $@ if set, stdin otherwise
# Evaluates via $(())
calc() { echo "$((${@:-$(</dev/stdin)}))"; }

# Print something in a terminal's titlebar
# \033]0 is the opening escape code
# \007 closes
title() { echo -ne "\033]0$*\007"; }
