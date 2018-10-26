#!/bin/bash

# Useless tricks which may make good notes

# Calculator, works on args or stdin
# Reads from $@ if set, stdin otherwise
# Evaluates via $(())
calc() { echo "$((${@:-$(</dev/stdin)}))"; }
